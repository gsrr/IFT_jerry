
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include <netinet/in.h>
#include <netinet/ip.h>
#include <net/if.h>
#include <netinet/if_ether.h>
#include <arpa/inet.h>

#include <pcap.h>

typedef u_int tcp_seq;
struct sniff_tcp {
	u_short th_sport;               /* source port */
	u_short th_dport;               /* destination port */
	tcp_seq th_seq;                 /* sequence number */
	tcp_seq th_ack;                 /* acknowledgement number */
	u_char  th_offx2;               /* data offset, rsvd */
#define TH_OFF(th)      (((th)->th_offx2 & 0xf0) >> 4)
	u_char  th_flags;
#define TH_FIN  0x01
#define TH_SYN  0x02
#define TH_RST  0x04
#define TH_PUSH 0x08
#define TH_ACK  0x10
#define TH_URG  0x20
#define TH_ECE  0x40
#define TH_CWR  0x80
#define TH_FLAGS        (TH_FIN|TH_SYN|TH_RST|TH_ACK|TH_URG|TH_ECE|TH_CWR)
	u_short th_win;                 /* window */
	u_short th_sum;                 /* checksum */
	u_short th_urp;                 /* urgent pointer */
};

/* Some helper functions, which we define at the end of this file. */

/* Returns a string representation of a timestamp. */
const char *timestamp_string(struct timeval ts);

/* Report a problem with dumping the packet with the given timestamp. */
void problem_pkt(struct timeval ts, const char *reason);

/* Report the specific problem of a packet being too short. */
void too_short(struct timeval ts, const char *truncated_hdr);

void print_hex_ascii_line(const u_char *payload, int len, int offset)
{

	int i;
	int gap;
	const u_char *ch;

	/* offset */
	printf("%05d   ", offset);

	/* hex */
	ch = payload;
	for(i = 0; i < len; i++) {
		printf("%02x ", *ch);
		ch++;
		/* print extra space after 8th byte for visual aid */
		if (i == 7)
			printf(" ");
	}
	/* print space to handle line less than 8 bytes */
	if (len < 8)
		printf(" ");

	/* fill hex gap with spaces if not full line */
	if (len < 16) {
		gap = 16 - len;
		for (i = 0; i < gap; i++) {
			printf("   ");
		}
	}
	printf("   ");

	/* ascii (if printable) */
	ch = payload;
	for(i = 0; i < len; i++) {
		if (isprint(*ch))
			printf("%c", *ch);
		else
			printf(".");
		ch++;
	}

	printf("\n");

	return;
}


void print_payload(const u_char *payload, int len)
{

	int len_rem = len;
	int line_width = 16;			/* number of bytes per line */
	int line_len;
	int offset = 0;					/* zero-based offset counter */
	const u_char *ch = payload;

	if (len <= 0)
		return;

	/* data fits on one line */
	if (len <= line_width) {
		print_hex_ascii_line(ch, len, offset);
		return;
	}

	/* data spans multiple lines */
	for ( ;; ) {
		/* compute current line length */
		line_len = line_width % len_rem;
		/* print line */
		print_hex_ascii_line(ch, line_len, offset);
		/* compute total remaining */
		len_rem = len_rem - line_len;
		/* shift pointer to remaining bytes to print */
		ch = ch + line_len;
		/* add offset */
		offset = offset + line_width;
		/* check if we have line width chars or less */
		if (len_rem <= line_width) {
			/* print last line and get out */
			print_hex_ascii_line(ch, len_rem, offset);
			break;
		}
	}

	return;
}


void dump_TCP_packet(const unsigned char *packet, struct timeval ts,
		unsigned int capture_len)
{
	struct ip *ip;
	const struct sniff_tcp *tcp;
	unsigned int IP_header_length;
	const char *payload; 
	int size_tcp;

		/* For simplicity, we assume Ethernet encapsulation. */

		if (capture_len < sizeof(struct ether_header))
		{
			/* We didn't even capture a full Ethernet header, so we
			 * can't analyze this any further.
			 */
			too_short(ts, "Ethernet header");
			return;
		}

	/* Skip over the Ethernet header. */
	packet += sizeof(struct ether_header);
	capture_len -= sizeof(struct ether_header);

	if (capture_len < sizeof(struct ip))
	{ /* Didn't capture a full IP header */
		too_short(ts, "IP header");
		return;
	}

	ip = (struct ip*) packet;
	IP_header_length = ip->ip_hl * 4;	/* ip_hl is in 4-byte words */

	if (capture_len < IP_header_length)
	{ /* didn't capture the full IP header including options */
		too_short(ts, "IP header with options");
		return;
	}

	if (ip->ip_p != IPPROTO_TCP)
	{
		problem_pkt(ts, "non-TCP packet");
		return;
	}

	/* Skip over the IP header to get to the UDP header. */
	packet += IP_header_length;
	capture_len -= IP_header_length;

	if (capture_len < sizeof(struct sniff_tcp))
	{
		too_short(ts, "TCP header");
		return;
	}

	tcp = (struct sniff_tcp*)packet;

	size_tcp = TH_OFF(tcp)*4;
	packet += size_tcp;
	capture_len -= size_tcp;
	payload = (u_char *)packet;
	if (capture_len > 6) {

		printf("       From: %s\n", inet_ntoa(ip->ip_src));
		printf("         To: %s\n", inet_ntoa(ip->ip_dst));
		printf("%s TCP src_port=%d dst_port=%d\n",
				timestamp_string(ts),
				ntohs(tcp->th_sport),
				ntohs(tcp->th_dport));
		printf("   Payload (%d bytes):\n", capture_len);
		print_payload(payload, capture_len);
	}
}


int main(int argc, char *argv[])
{
	pcap_t *pcap;
	const unsigned char *packet;
	char errbuf[PCAP_ERRBUF_SIZE];
	struct pcap_pkthdr header;

	/* Skip over the program name. */
	++argv; --argc;

	/* We expect exactly one argument, the name of the file to dump. */
	if ( argc != 1 )
	{
		fprintf(stderr, "program requires one argument, the trace file to dump\n");
		exit(1);
	}

	pcap = pcap_open_offline(argv[0], errbuf);
	if (pcap == NULL)
	{
		fprintf(stderr, "error reading pcap file: %s\n", errbuf);
		exit(1);
	}

	/* Now just loop through extracting packets as long as we have
	 * some to read.
	 */
	while ((packet = pcap_next(pcap, &header)) != NULL){
		dump_TCP_packet(packet, header.ts, header.caplen);
	}

	// terminate
	return 0;
}


/* Note, this routine returns a pointer into a static buffer, and
 * so each call overwrites the value returned by the previous call.
 */
const char *timestamp_string(struct timeval ts)
{
	static char timestamp_string_buf[256];

	sprintf(timestamp_string_buf, "%d.%06d",
			(int) ts.tv_sec, (int) ts.tv_usec);

	return timestamp_string_buf;
}

void problem_pkt(struct timeval ts, const char *reason)
{
	fprintf(stderr, "%s: %s\n", timestamp_string(ts), reason);
}

void too_short(struct timeval ts, const char *truncated_hdr)
{
	fprintf(stderr, "packet with timestamp %s is truncated and lacks a full %s\n",
			timestamp_string(ts), truncated_hdr);
}
