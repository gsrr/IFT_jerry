a:4:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:4066:"
count : 37


[  230.448059] ext4_init_reserve_inode_table0: dm-0, 5554
[  230.453188] ext4_init_reserve_inode_table2: dm-0, 5554, 0, 0, 4096
[  230.459595] EXT4-fs (dm-0): mounted filesystem with ordered data mode. Opts: usrjquota=aquota.user,jqfmt=vfsv0,user_xattr,data=ordered,data_err=abort,delalloc,nopriv,nodiscard,noacl
[  230.696711] device-mapper: tier: set allocation tier failed
[  231.307942] Adding 16777212k swap on /share/CACHEDEV1_DATA/.swap/qnap_swap.  Priority:-5 extents:16 across:17899516k FS
[  231.350167] VFIO - User Level meta-driver version: 0.3
[  233.418462] BUG: unable to handle kernel NULL pointer dereference at 000000000000000a
[  233.426286] IP: kernfs_refresh_inode+0x21/0xc0
[  233.430721] PGD 80000008721f2067 P4D 80000008721f2067 PUD 81d34f067 PMD 0 
[  233.437585] Oops: 0000 [#1] SMP PTI
[  233.441065] Modules linked in: vfio_pci irqbypass vfio_virqfd vfio ipv6 ufsd(PO) jnl(O) pl2303 usbserial qm2_i2c(O) i2c_imc(O) intel_ips drbd lru_cache flashcache(O) dm_tier_hro_algo dm_thin_pool dm_bio_prison dm_persistent_data hal_netlink(O) k10temp coretemp atlantic(O) igb e1000e mv14xx(PO) mpt3sas scsi_transport_sas raid_class celerity16fc_cfg(O) qla2xxx scsi_transport_fc usb_storage xhci_pci xhci_hcd usblp uhci_hcd ehci_pci ehci_hcd
[  233.479751] CPU: 7 PID: 4904 Comm: find Tainted: P           O    4.14.24-qnap #1
[  233.487220] Hardware name: Default string Z509/B492, BIOS V3WBAR13.BIN 06/19/2019
[  233.494685] task: ffff880875738800 task.stack: ffffc90000944000
[  233.500593] RIP: 0010:kernfs_refresh_inode+0x21/0xc0
[  233.505545] RSP: 0018:ffffc90000947b68 EFLAGS: 00010202
[  233.510760] RAX: 0000000000008124 RBX: 0000000000000002 RCX: 0000000000000018
[  233.517878] RDX: 00000000375f7194 RSI: ffff88081af917e0 RDI: ffff880879b29f80
[  233.524997] RBP: ffffc90000947b88 R08: 0000000000000000 R09: 0000000000000001
[  233.532117] R10: ffffc90000947b50 R11: 0000000ea1cf4069 R12: ffff88081af917e0
[  233.539238] R13: ffff880879b29f80 R14: 0000000000000000 R15: ffff88087614e720
[  233.546357] FS:  00007f02aa89e700(0000) GS:ffff88089fdc0000(0000) knlGS:0000000000000000
[  233.554431] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  233.560164] CR2: 000000000000000a CR3: 000000081b5fc001 CR4: 00000000003606e0
[  233.567284] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[  233.574403] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[  233.581523] Call Trace:
[  233.583965]  kernfs_get_inode+0x91/0x110
[  233.587882]  kernfs_iop_lookup+0x60/0x90
[  233.591798]  lookup_slow+0x91/0x140
[  233.595277]  walk_component+0x220/0x600
[  233.599104]  ? path_init+0x1da/0x300
[  233.602669]  path_lookupat+0x63/0x200
[  233.606324]  filename_lookup+0xa4/0x160
[  233.610149]  ? do_filp_open+0x99/0xf0
[  233.613803]  ? compact_node.isra.39+0x90/0xc0
[  233.618154]  ? locked_inode_to_wb_and_lock_list+0x48/0x100
[  233.623627]  ? cp_new_stat+0x141/0x160
[  233.627367]  ? vfs_statx+0x5f/0xb0
[  233.630758]  vfs_statx+0x5f/0xb0
[  233.633978]  SYSC_newlstat+0x26/0x40
[  233.637546]  do_syscall_64+0x83/0x2c0
[  233.641200]  entry_SYSCALL_64_after_hwframe+0x3d/0xa2
[  233.646242] RIP: 0033:0x7f02aa0bbfa5
[  233.649809] RSP: 002b:00007ffe30c73e88 EFLAGS: 00000246 ORIG_RAX: 0000000000000006
[  233.657360] RAX: ffffffffffffffda RBX: 0000000002605240 RCX: 00007f02aa0bbfa5
[  233.664481] RDX: 00007ffe30c73eb0 RSI: 00007ffe30c73eb0 RDI: 0000000002605240
[  233.671602] RBP: 0000000000000001 R08: 0000000000000000 R09: 0000000000000003
[  233.678720] R10: 656d69746e75722f R11: 0000000000000246 R12: 0000000000450fa2
[  233.685839] R13: 0000000000000003 R14: 0000000000000000 R15: 0000000000450fa2
[  233.692960] Code: ff eb e5 90 90 90 90 90 90 90 55 48 89 e5 41 56 41 55 41 54 53 49 89 fd 48 8b 5f 78 0f b7 47 72 49 89 f4 48 85 db 66 89 06 74 6a <8b> 43 08 4c 8b 76 28 89 46 04 8b 43 0c 89 46 08 48 8b 7b 18 48 
[  233.711795] RIP: kernfs_refresh_inode+0x21/0xc0 RSP: ffffc90000947b68
[  233.718223] CR2: 000000000000000a
[  233.721530] ---[ end trace c5edd29969ccca1f ]---

";i:1;N;i:2;N;}i:2;i:8;}i:2;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:116555:"
[    0.000000]   node   0: [mem 0x000000004c295000-0x000000004c596fff]
[    0.000000]   node   0: [mem 0x000000004d959000-0x000000004f7fffff]
[    0.000000]   node   0: [mem 0x0000000100000000-0x000000089fffffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000000001000-0x000000089fffffff]
[    0.000000] ACPI: PM-Timer IO Port: 0x1808
[    0.000000] ACPI: x2apic entry ignored
[    0.000000] ACPI: x2apic entry ignored
[    0.000000] ACPI: x2apic entry ignored
[    0.000000] ACPI: x2apic entry ignored
[    0.000000] ACPI: x2apic entry ignored
[    0.000000] ACPI: x2apic entry ignored
[    0.000000] ACPI: x2apic entry ignored
[    0.000000] ACPI: x2apic entry ignored
[    0.000000] ACPI: x2apic entry ignored
[    0.000000] ACPI: x2apic entry ignored
[    0.000000] ACPI: x2apic entry ignored
[    0.000000] ACPI: x2apic entry ignored
[    0.000000] ACPI: x2apic entry ignored
[    0.000000] ACPI: x2apic entry ignored
[    0.000000] ACPI: x2apic entry ignored
[    0.000000] ACPI: x2apic entry ignored
[    0.000000] ACPI: x2apic entry ignored
[    0.000000] ACPI: x2apic entry ignored
[    0.000000] ACPI: x2apic entry ignored
[    0.000000] ACPI: x2apic entry ignored
[    0.000000] ACPI: x2apic entry ignored
[    0.000000] ACPI: x2apic entry ignored
[    0.000000] ACPI: x2apic entry ignored
[    0.000000] ACPI: x2apic entry ignored
[    0.000000] ACPI: x2apic entry ignored
[    0.000000] ACPI: x2apic entry ignored
[    0.000000] ACPI: x2apic entry ignored
[    0.000000] ACPI: x2apic entry ignored
[    0.000000] ACPI: x2apic entry ignored
[    0.000000] ACPI: x2apic entry ignored
[    0.000000] ACPI: x2apic entry ignored
[    0.000000] ACPI: x2apic entry ignored
[    0.000000] ACPI: x2apic entry ignored
[    0.000000] ACPI: x2apic entry ignored
[    0.000000] ACPI: x2apic entry ignored
[    0.000000] ACPI: x2apic entry ignored
[    0.000000] ACPI: x2apic entry ignored
[    0.000000] ACPI: x2apic entry ignored
[    0.000000] ACPI: x2apic entry ignored
[    0.000000] ACPI: x2apic entry ignored
[    0.000000] ACPI: x2apic entry ignored
[    0.000000] ACPI: x2apic entry ignored
[    0.000000] ACPI: x2apic entry ignored
[    0.000000] ACPI: x2apic entry ignored
[    0.000000] ACPI: x2apic entry ignored
[    0.000000] ACPI: x2apic entry ignored
[    0.000000] ACPI: x2apic entry ignored
[    0.000000] ACPI: x2apic entry ignored
[    0.000000] ACPI: x2apic entry ignored
[    0.000000] ACPI: x2apic entry ignored
[    0.000000] ACPI: x2apic entry ignored
[    0.000000] ACPI: x2apic entry ignored
[    0.000000] ACPI: x2apic entry ignored
[    0.000000] ACPI: x2apic entry ignored
[    0.000000] ACPI: x2apic entry ignored
[    0.000000] ACPI: x2apic entry ignored
[    0.000000] ACPI: X2APIC_NMI (uid[0xffffffff] high level lint[0x1])
[    0.000000] ACPI: LAPIC_NMI (acpi_id[0xff] high level lint[0x1])
[    0.000000] IOAPIC[0]: apic_id 8, version 32, address 0xfec00000, GSI 0-23
[    0.000000] IOAPIC[1]: apic_id 9, version 32, address 0xfec01000, GSI 24-31
[    0.000000] IOAPIC[2]: apic_id 10, version 32, address 0xfec08000, GSI 32-39
[    0.000000] IOAPIC[3]: apic_id 11, version 32, address 0xfec10000, GSI 40-47
[    0.000000] IOAPIC[4]: apic_id 12, version 32, address 0xfec18000, GSI 48-55
[    0.000000] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
[    0.000000] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
[    0.000000] Using ACPI (MADT) for SMP configuration information
[    0.000000] ACPI: HPET id: 0x8086a701 base: 0xfed00000
[    0.000000] smpboot: Allowing 8 CPUs, 0 hotplug CPUs
[    0.000000] PM: Registered nosave memory: [mem 0x00000000-0x00000fff]
[    0.000000] PM: Registered nosave memory: [mem 0x00099000-0x00099fff]
[    0.000000] PM: Registered nosave memory: [mem 0x0009a000-0x0009ffff]
[    0.000000] PM: Registered nosave memory: [mem 0x000a0000-0x000dffff]
[    0.000000] PM: Registered nosave memory: [mem 0x000e0000-0x000fffff]
[    0.000000] PM: Registered nosave memory: [mem 0x08000000-0x081fffff]
[    0.000000] PM: Registered nosave memory: [mem 0x4b2c0000-0x4c294fff]
[    0.000000] PM: Registered nosave memory: [mem 0x4c597000-0x4d3a1fff]
[    0.000000] PM: Registered nosave memory: [mem 0x4d3a2000-0x4d958fff]
[    0.000000] PM: Registered nosave memory: [mem 0x4f800000-0x6fffffff]
[    0.000000] PM: Registered nosave memory: [mem 0x70000000-0xfdffffff]
[    0.000000] PM: Registered nosave memory: [mem 0xfe000000-0xfe010fff]
[    0.000000] PM: Registered nosave memory: [mem 0xfe011000-0xfebfffff]
[    0.000000] PM: Registered nosave memory: [mem 0xfec00000-0xfec00fff]
[    0.000000] PM: Registered nosave memory: [mem 0xfec01000-0xfecfffff]
[    0.000000] PM: Registered nosave memory: [mem 0xfed00000-0xfed00fff]
[    0.000000] PM: Registered nosave memory: [mem 0xfed01000-0xfed1ffff]
[    0.000000] PM: Registered nosave memory: [mem 0xfed20000-0xfed44fff]
[    0.000000] PM: Registered nosave memory: [mem 0xfed45000-0xfedfffff]
[    0.000000] PM: Registered nosave memory: [mem 0xfee00000-0xfee00fff]
[    0.000000] PM: Registered nosave memory: [mem 0xfee01000-0xfeffffff]
[    0.000000] PM: Registered nosave memory: [mem 0xff000000-0xffffffff]
[    0.000000] e820: [mem 0x70000000-0xfdffffff] available for PCI devices
[    0.000000] clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 1910969940391419 ns
[    0.000000] setup_percpu: NR_CPUS:36 nr_cpumask_bits:36 nr_cpu_ids:8 nr_node_ids:1
[    0.000000] percpu: Embedded 42 pages/cpu @ffff88089fc00000 s134936 r8192 d28904 u262144
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 8181410
[    0.000000] Kernel command line: console=ttyS0,115200n8 consoleblank=0 intel_iommu=on iommu=pt pcie_acs_override=downstream zswap.enabled=1 zswap.compressor=lz4 memmap=2M$0x8000000 ramoops.mem_ad                                       dress=0x8000000 ramoops.mem_size=0x200000 ramoops.console_size=0x100000 BOOT_IMAGE=/boot/bzImage root=/dev/ram0 rw
[    0.000000] DMAR: IOMMU enabled
[    0.000000] PID hash table entries: 4096 (order: 3, 32768 bytes)
[    0.000000] Dentry cache hash table entries: 4194304 (order: 13, 33554432 bytes)
[    0.000000] Inode-cache hash table entries: 2097152 (order: 12, 16777216 bytes)
[    0.000000] Memory: 32557276K/33245188K available (12300K kernel code, 850K rwdata, 3360K rodata, 1468K init, 672K bss, 687912K reserved, 0K cma-reserved)
[    0.000000] Kernel/User page tables isolation: enabled
[    0.000000] Hierarchical RCU implementation.
[    0.000000]  RCU restricting CPUs from NR_CPUS=36 to nr_cpu_ids=8.
[    0.000000] RCU: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=8
[    0.000000] NR_IRQS: 4352, nr_irqs: 1032, preallocated irqs: 16
[    0.000000] Console: colour dummy device 80x25
[    0.000000] console [ttyS0] enabled
[    0.000000] clocksource: hpet: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 79635855245 ns
[    0.001000] tsc: Detected 3600.000 MHz processor
[    0.002000] Calibrating delay loop (skipped), value calculated using timer frequency.. 7200.00 BogoMIPS (lpj=3600000)
[    0.003005] pid_max: default: 32768 minimum: 301
[    0.004010] ACPI: Core revision 20170728
[    0.019916] ACPI: 4 ACPI AML tables successfully acquired and loaded
[    0.020073] Mount-cache hash table entries: 65536 (order: 7, 524288 bytes)
[    0.021041] Mountpoint-cache hash table entries: 65536 (order: 7, 524288 bytes)
[    0.022117] CPU: Physical Processor ID: 0
[    0.023004] CPU: Processor Core ID: 0
[    0.024007] ENERGY_PERF_BIAS: Set to 'normal', was 'performance'
[    0.025004] ENERGY_PERF_BIAS: View and update with x86_energy_perf_policy(8)
[    0.026008] mce: CPU supports 20 MCE banks
[    0.027014] CPU0: Thermal monitoring enabled (TM1)
[    0.028040] process: using mwait in idle threads
[    0.029006] Last level iTLB entries: 4KB 64, 2MB 8, 4MB 8
[    0.030004] Last level dTLB entries: 4KB 64, 2MB 0, 4MB 0, 1GB 4
[    0.031005] Spectre V2 : Vulnerable: Minimal generic ASM retpoline
[    0.032004] Spectre V2 : Spectre v2 mitigation: Filling RSB on context switch
[    0.033004] Spectre V2 : Spectre v2 mitigation: Enabling Indirect Branch Prediction Barrier
[    0.034004] Spectre V2 : Enabling Restricted Speculation for firmware calls
[    0.035005] Speculative Store Bypass: Mitigation: Speculative Store Bypass disabled via prctl and seccomp
[    0.036076] Freeing SMP alternatives memory: 44K
[    0.037437] smpboot: Max logical packages: 2
[    0.039326] ..TIMER: vector=0x30 apic1=0 pin1=2 apic2=-1 pin2=-1
[    0.049353] smpboot: CPU0: Intel(R) Xeon(R) W-2123 CPU @ 3.60GHz (family: 0x6, model: 0x55, stepping: 0x4)
[    0.050031] Performance Events: PEBS fmt3+, Skylake events, 32-deep LBR, full-width counters, Intel PMU driver.
[    0.051001] ... version:                4
[    0.052000] ... bit width:              48
[    0.053000] ... generic registers:      4
[    0.054000] ... value mask:             0000ffffffffffff
[    0.055000] ... max period:             00007fffffffffff
[    0.056000] ... fixed-purpose events:   3
[    0.057000] ... event mask:             000000070000000f
[    0.058023] Hierarchical SRCU implementation.
[    0.060225] NMI watchdog: Enabled. Permanently consumes one hw-PMU counter.
[    0.061010] smp: Bringing up secondary CPUs ...
[    0.062043] x86: Booting SMP configuration:
[    0.063001] .... node  #0, CPUs:      #1 #2 #3 #4 #5 #6 #7
[    0.068446] smp: Brought up 1 node, 8 CPUs
[    0.070002] smpboot: Total of 8 processors activated (57600.00 BogoMIPS)
[    0.072521] devtmpfs: initialized
[    0.073107] PM: Registering ACPI NVS region [mem 0x4c597000-0x4d3a1fff] (14725120 bytes)
[    0.074150] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 1911260446275000 ns
[    0.075003] futex hash table entries: 2048 (order: 5, 131072 bytes)
[    0.076037] xor: automatically using best checksumming function   avx
[    0.077008] pinctrl core: initialized pinctrl subsystem
[    0.078105] RTC time:  6:46:01, date: 08/10/19
[    0.079566] NET: Registered protocol family 16
[    0.080063] ramoops: using module parameters
[    0.081854] pstore: using zlib compression
[    0.082216] console [pstore-1] enabled
[    0.083000] pstore: Registered ramoops as persistent store backend
[    0.084001] ramoops: attached 0x200000@0x8000000, ecc: 0/0
[    0.085043] cpuidle: using governor ladder
[    0.089004] cpuidle: using governor menu
[    0.093004] Error parsing PCC subspaces from PCCT
[    0.097066] ACPI: bus type PCI registered
[    0.101001] acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
[    0.108010] PCI: MMCONFIG for domain 0000 [bus 00-ff] at [mem 0x60000000-0x6fffffff] (base 0x60000000)
[    0.117001] PCI: MMCONFIG at [mem 0x60000000-0x6fffffff] reserved in E820
[    0.124008] PCI: Using configuration type 1 for base access
[    0.132020] HugeTLB registered 1.00 GiB page size, pre-allocated 0 pages
[    0.138002] HugeTLB registered 2.00 MiB page size, pre-allocated 0 pages
[    0.162000] raid6: sse2x1   gen() 12773 MB/s
[    0.182757] raid6: sse2x1   xor()  9714 MB/s
[    0.204000] raid6: sse2x2   gen() 15964 MB/s
[    0.224754] raid6: sse2x2   xor() 11136 MB/s
[    0.246000] raid6: sse2x4   gen() 17710 MB/s
[    0.266751] raid6: sse2x4   xor() 12494 MB/s
[    0.288000] raid6: avx2x1   gen() 25757 MB/s
[    0.308754] raid6: avx2x1   xor() 18863 MB/s
[    0.329756] raid6: avx2x2   gen() 29859 MB/s
[    0.350758] raid6: avx2x2   xor() 20845 MB/s
[    0.372000] raid6: avx2x4   gen() 31937 MB/s
[    0.392758] raid6: avx2x4   xor() 23339 MB/s
[    0.413755] raid6: avx512x1 gen() 34187 MB/s
[    0.434756] raid6: avx512x1 xor() 19373 MB/s
[    0.456000] raid6: avx512x2 gen() 42808 MB/s
[    0.476759] raid6: avx512x2 xor() 24410 MB/s
[    0.498000] raid6: avx512x4 gen() 49738 MB/s
[    0.518758] raid6: avx512x4 xor() 23867 MB/s
[    0.523000] raid6: using algorithm avx512x4 gen() 49738 MB/s
[    0.528000] raid6: .... xor() 23867 MB/s, rmw enabled
[    0.533000] raid6: using avx512x2 recovery algorithm
[    0.538036] ACPI: Added _OSI(Module Device)
[    0.539014] ACPI: Added _OSI(Processor Device)
[    0.540000] ACPI: Added _OSI(3.0 _SCP Extensions)
[    0.541000] ACPI: Added _OSI(Processor Aggregator Device)
[    0.542170] ACPI: Executed 4 blocks of module-level executable AML code
[    0.558462] ACPI: Dynamic OEM Table Load:
[    0.563935] ACPI: Executed 1 blocks of module-level executable AML code
[    0.570038] ACPI: Dynamic OEM Table Load:
[    0.574559] ACPI: Executed 1 blocks of module-level executable AML code
[    0.581051] ACPI: Dynamic OEM Table Load:
[    0.589853] ACPI: Executed 1 blocks of module-level executable AML code
[    0.601196] ACPI: Interpreter enabled
[    0.605014] ACPI: (supports S0 S3 S4 S5)
[    0.609001] ACPI: Using IOAPIC for interrupt routing
[    0.614019] PCI: Using host bridge windows from ACPI; if necessary, use "pci=nocrs" and report a bug
[    0.623242] ACPI: GPE 0x61 active on init
[    0.627000] ACPI: Enabled 7 GPEs in block 00 to 7F
[    0.644468] ACPI: PCI Root Bridge [PC00] (domain 0000 [bus 00-15])
[    0.650003] acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM ClockPM Segments MSI]
[    0.659061] acpi PNP0A08:00: _OSC: platform does not support [AER]
[    0.665055] acpi PNP0A08:00: _OSC: OS now controls [PCIeHotplug PME PCIeCapability]
[    0.673074] acpi PNP0A08:00: host bridge window expanded to [mem 0xfd000000-0xfe7fffff window]; [mem 0xfd000000-0xfe7fffff window] ignored
[    0.685256] PCI host bridge to bus 0000:00
[    0.689001] pci_bus 0000:00: root bus resource [io  0x0000-0x0cf7 window]
[    0.696001] pci_bus 0000:00: root bus resource [io  0x1000-0x3fff window]
[    0.703001] pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000bffff window]
[    0.710001] pci_bus 0000:00: root bus resource [mem 0x000c4000-0x000c7fff window]
[    0.718001] pci_bus 0000:00: root bus resource [mem 0xfd000000-0xfe7fffff window]
[    0.725001] pci_bus 0000:00: root bus resource [mem 0x70000000-0x92ffffff window]
[    0.733001] pci_bus 0000:00: root bus resource [mem 0x380000000000-0x38003fffffff window]
[    0.741001] pci_bus 0000:00: root bus resource [bus 00-15]
[    0.749005] pci 0000:00:1c.4: Intel SPT PCH root port ACS workaround enabled
[    0.756164] pci 0000:00:1c.6: Intel SPT PCH root port ACS workaround enabled
[    0.764005] pci 0000:00:1c.0: PCI bridge to [bus 01]
[    0.769089] pci 0000:02:00.0: enabling Extended Tags
[    0.774090] pci 0000:00:1c.4: PCI bridge to [bus 02]
[    0.779296] pci 0000:00:1c.6: PCI bridge to [bus 03]
[    0.784020] pci 0000:00:1c.0: Max Payload Size set to  256/ 256 (was  128), Max Read Rq  128
[    0.793004] pci 0000:00:1c.4: Max Payload Size set to  128/ 128 (was  128), Max Read Rq  128
[    0.801005] pci 0000:02:00.0: Max Payload Size set to  128/ 512 (was  128), Max Read Rq  512
[    0.809004] pci 0000:00:1c.6: Max Payload Size set to  128/ 128 (was  128), Max Read Rq  128
[    0.818009] pci 0000:03:00.0: Max Payload Size set to  128/ 512 (was  128), Max Read Rq  512
[    0.827000] ACPI: PCI Root Bridge [PC01] (domain 0000 [bus 16-63])
[    0.833002] acpi PNP0A08:01: _OSC: OS supports [ExtendedConfig ASPM ClockPM Segments MSI]
[    0.841208] acpi PNP0A08:01: _OSC: platform does not support [AER]
[    0.848116] acpi PNP0A08:01: _OSC: OS now controls [PCIeHotplug PME PCIeCapability]
[    0.855059] PCI host bridge to bus 0000:16
[    0.859001] pci_bus 0000:16: root bus resource [io  0x4000-0x7fff window]
[    0.866001] pci_bus 0000:16: root bus resource [mem 0x93000000-0xb5ffffff window]
[    0.874001] pci_bus 0000:16: root bus resource [mem 0x380040000000-0x38007fffffff window]
[    0.882001] pci_bus 0000:16: root bus resource [bus 16-63]
[    0.889006] ACPI: PCI Root Bridge [PC02] (domain 0000 [bus 64-b1])
[    0.895002] acpi PNP0A08:02: _OSC: OS supports [ExtendedConfig ASPM ClockPM Segments MSI]
[    0.903197] acpi PNP0A08:02: _OSC: platform does not support [AER]
[    0.909103] acpi PNP0A08:02: _OSC: OS now controls [PCIeHotplug PME PCIeCapability]
[    0.917044] PCI host bridge to bus 0000:64
[    0.921001] pci_bus 0000:64: root bus resource [io  0x8000-0xbfff window]
[    0.928001] pci_bus 0000:64: root bus resource [mem 0xb6000000-0xd8ffffff window]
[    0.935001] pci_bus 0000:64: root bus resource [mem 0x380080000000-0x3800bfffffff window]
[    0.944001] pci_bus 0000:64: root bus resource [bus 64-b1]
[    0.950270] ACPI: PCI Root Bridge [PC03] (domain 0000 [bus b2-ff])
[    0.957002] acpi PNP0A08:03: _OSC: OS supports [ExtendedConfig ASPM ClockPM Segments MSI]
[    0.965203] acpi PNP0A08:03: _OSC: platform does not support [AER]
[    0.971108] acpi PNP0A08:03: _OSC: OS now controls [PCIeHotplug PME PCIeCapability]
[    0.979041] PCI host bridge to bus 0000:b2
[    0.983001] pci_bus 0000:b2: root bus resource [io  0xc000-0xffff window]
[    0.990001] pci_bus 0000:b2: root bus resource [mem 0xd9000000-0xfbffffff window]
[    0.997001] pci_bus 0000:b2: root bus resource [mem 0x3800c0000000-0x3800ffffffff window]
[    1.005001] pci_bus 0000:b2: root bus resource [bus b2-ff]
[    1.011181] pci 0000:b2:02.0: enabling Extended Tags
[    1.016590] pci 0000:b2:00.0: PCI bridge to [bus b3]
[    1.021128] pci 0000:b2:01.0: PCI bridge to [bus b4]
[    1.030013] pci 0000:b2:02.0: PCI bridge to [bus b5]
[    1.034018] pci 0000:b2:00.0: Max Payload Size set to  256/ 256 (was  256), Max Read Rq  128
[    1.043003] pci 0000:b3:00.0: Max Payload Size set to  256/ 512 (was  256), Max Read Rq  512
[    1.051003] pci 0000:b2:01.0: Max Payload Size set to  256/ 256 (was  256), Max Read Rq  128
[    1.060003] pci 0000:b4:00.0: Max Payload Size set to  256/ 512 (was  256), Max Read Rq  512
[    1.068003] pci 0000:b2:02.0: Max Payload Size set to  256/ 256 (was  256), Max Read Rq  128
[    1.077003] pci 0000:b5:00.0: Max Payload Size set to  256/ 512 (was  256), Max Read Rq  512
[    1.085085] ACPI: PCI Interrupt Link [LNKA] (IRQs 3 4 5 6 10 *11 12 14 15)
[    1.092030] ACPI: PCI Interrupt Link [LNKB] (IRQs 3 4 5 6 *10 11 12 14 15)
[    1.099029] ACPI: PCI Interrupt Link [LNKC] (IRQs 3 4 5 6 10 *11 12 14 15)
[    1.106028] ACPI: PCI Interrupt Link [LNKD] (IRQs 3 4 5 6 10 *11 12 14 15)
[    1.113028] ACPI: PCI Interrupt Link [LNKE] (IRQs 3 4 5 6 10 *11 12 14 15)
[    1.119028] ACPI: PCI Interrupt Link [LNKF] (IRQs 3 4 5 6 10 *11 12 14 15)
[    1.126028] ACPI: PCI Interrupt Link [LNKG] (IRQs 3 4 5 6 10 *11 12 14 15)
[    1.133028] ACPI: PCI Interrupt Link [LNKH] (IRQs 3 4 5 6 10 *11 12 14 15)
[    1.140083] SCSI subsystem initialized
[    1.144011] ACPI: bus type USB registered
[    1.148014] usbcore: registered new interface driver usbfs
[    1.154006] usbcore: registered new interface driver hub
[    1.159014] usbcore: registered new device driver usb
[    1.164014] Linux video capture interface: v2.00
[    1.168008] pps_core: LinuxPPS API ver. 1 registered
[    1.173000] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
[    1.183002] PTP clock support registered
[    1.187032] vgaarb: loaded
[    1.189013] Advanced Linux Sound Architecture Driver Initialized.
[    1.195009] PCI: Using ACPI for IRQ routing
[    1.204236] Bluetooth: Core ver 2.22
[    1.207003] NET: Registered protocol family 31
[    1.212001] Bluetooth: HCI device and connection manager initialized
[    1.218001] Bluetooth: HCI socket layer initialized
[    1.223001] Bluetooth: L2CAP socket layer initialized
[    1.228002] Bluetooth: SCO socket layer initialized
[    1.233086] hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0, 0, 0, 0, 0, 0
[    1.239001] hpet0: 8 comparators, 64-bit 24.000000 MHz counter
[    1.247023] clocksource: Switched to clocksource hpet
[    1.252088] VFS: Disk quotas dquot_6.6.0
[    1.256050] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
[    1.262946] FS-Cache: Loaded
[    1.265897] CacheFiles: Loaded
[    1.268977] pnp: PnP ACPI init
[    1.272284] system 00:01: [io  0x0500-0x053f] has been reserved
[    1.278222] system 00:01: [io  0x0400-0x047f] has been reserved
[    1.284150] system 00:01: [io  0x0540-0x057f] has been reserved
[    1.290079] system 00:01: [io  0x0600-0x061f] has been reserved
[    1.296030] system 00:01: [io  0x0ca0-0x0ca5] has been reserved
[    1.301970] system 00:01: [io  0x0880-0x0883] has been reserved
[    1.307897] system 00:01: [io  0x0800-0x081f] has been reserved
[    1.313824] system 00:01: [mem 0xfed1c000-0xfed3ffff] could not be reserved
[    1.320792] system 00:01: [mem 0xfed45000-0xfed8bfff] has been reserved
[    1.327415] system 00:01: [mem 0xff000000-0xffffffff] has been reserved
[    1.334045] system 00:01: [mem 0xfee00000-0xfeefffff] could not be reserved
[    1.341013] system 00:01: [mem 0xfed12000-0xfed1200f] has been reserved
[    1.347647] system 00:01: [mem 0xfed12010-0xfed1201f] has been reserved
[    1.354269] system 00:01: [mem 0xfed1b000-0xfed1bfff] has been reserved
[    1.360980] system 00:02: [io  0x0a00-0x0a0f] has been reserved
[    1.367578] ACPI: IRQ 11 override to edge, high
[    1.372190] system 00:07: [mem 0xfd000000-0xfdabffff] has been reserved
[    1.378819] system 00:07: [mem 0xfdad0000-0xfdadffff] has been reserved
[    1.385439] system 00:07: [mem 0xfdb00000-0xfdffffff] has been reserved
[    1.392063] system 00:07: [mem 0xfe000000-0xfe00ffff] has been reserved
[    1.398686] system 00:07: [mem 0xfe011000-0xfe01ffff] has been reserved
[    1.405307] system 00:07: [mem 0xfe036000-0xfe03bfff] has been reserved
[    1.411930] system 00:07: [mem 0xfe03d000-0xfe3fffff] has been reserved
[    1.418550] system 00:07: [mem 0xfe410000-0xfe7fffff] has been reserved
[    1.425287] system 00:08: [io  0x0f00-0x0ffe] has been reserved
[    1.431639] system 00:09: [mem 0xfdaf0000-0xfdafffff] has been reserved
[    1.438268] system 00:09: [mem 0xfdae0000-0xfdaeffff] has been reserved
[    1.444888] system 00:09: [mem 0xfdac0000-0xfdacffff] has been reserved
[    1.451848] pnp: PnP ACPI: found 10 devices
[    1.463077] clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xffffff, max_idle_ns: 2085701024 ns
[    1.471975] pci 0000:00:1c.0: BAR 14: assigned [mem 0x70000000-0x701fffff]
[    1.478861] pci 0000:00:1c.0: BAR 15: assigned [mem 0x380000000000-0x3800001fffff 64bit pref]
[    1.487391] pci 0000:00:1c.0: BAR 13: assigned [io  0x1000-0x1fff]
[    1.493582] pci 0000:00:1c.0: PCI bridge to [bus 01]
[    1.498556] pci 0000:00:1c.0:   bridge window [io  0x1000-0x1fff]
[    1.504657] pci 0000:00:1c.0:   bridge window [mem 0x70000000-0x701fffff]
[    1.511451] pci 0000:00:1c.0:   bridge window [mem 0x380000000000-0x3800001fffff 64bit pref]
[    1.519894] pci 0000:00:1c.4: PCI bridge to [bus 02]
[    1.524872] pci 0000:00:1c.4:   bridge window [mem 0x92800000-0x92cfffff]
[    1.531670] pci 0000:00:1c.6: PCI bridge to [bus 03]
[    1.536644] pci 0000:00:1c.6:   bridge window [io  0x2000-0x2fff]
[    1.542747] pci 0000:00:1c.6:   bridge window [mem 0x92d00000-0x92efffff]
[    1.549644] pci 0000:b2:00.0: BAR 15: assigned [mem 0x3800c0000000-0x3800c01fffff 64bit pref]
[    1.558173] pci 0000:b2:01.0: BAR 15: assigned [mem 0x3800c0200000-0x3800c03fffff 64bit pref]
[    1.566700] pci 0000:b2:00.0: BAR 13: assigned [io  0xc000-0xcfff]
[    1.572889] pci 0000:b2:01.0: BAR 13: assigned [io  0xd000-0xdfff]
[    1.579077] pci 0000:b2:00.0: PCI bridge to [bus b3]
[    1.584055] pci 0000:b2:00.0:   bridge window [io  0xc000-0xcfff]
[    1.590159] pci 0000:b2:00.0:   bridge window [mem 0xfbe00000-0xfbefffff]
[    1.596955] pci 0000:b2:00.0:   bridge window [mem 0x3800c0000000-0x3800c01fffff 64bit pref]
[    1.605395] pci 0000:b2:01.0: PCI bridge to [bus b4]
[    1.610370] pci 0000:b2:01.0:   bridge window [io  0xd000-0xdfff]
[    1.616471] pci 0000:b2:01.0:   bridge window [mem 0xfbd00000-0xfbdfffff]
[    1.623267] pci 0000:b2:01.0:   bridge window [mem 0x3800c0200000-0x3800c03fffff 64bit pref]
[    1.631707] pci 0000:b2:02.0: PCI bridge to [bus b5]
[    1.636683] pci 0000:b2:02.0:   bridge window [mem 0xfbc00000-0xfbcfffff]
[    1.643476] pci 0000:b2:02.0:   bridge window [mem 0xfba00000-0xfbbfffff 64bit pref]
[    1.651263] NET: Registered protocol family 2
[    1.655702] TCP established hash table entries: 262144 (order: 9, 2097152 bytes)
[    1.663285] TCP bind hash table entries: 65536 (order: 8, 1048576 bytes)
[    1.670079] TCP: Hash tables configured (established 262144 bind 65536)
[    1.676720] UDP hash table entries: 16384 (order: 7, 524288 bytes)
[    1.682948] UDP-Lite hash table entries: 16384 (order: 7, 524288 bytes)
[    1.689635] NET: Registered protocol family 1
[    1.694144] RPC: Registered named UNIX socket transport module.
[    1.700072] RPC: Registered udp transport module.
[    1.704786] RPC: Registered tcp transport module.
[    1.709509] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    1.716249] Trying to unpack rootfs image as initramfs...
[    5.139672] Freeing initrd memory: 25708K
[    5.143759] DMAR: Host address width 46
[    5.147621] DMAR: DRHD base: 0x000000b5ffc000 flags: 0x0
[    5.152989] DMAR: dmar0: reg_base_addr b5ffc000 ver 1:0 cap 8d2078c106f0466 ecap f020df
[    5.161000] DMAR: DRHD base: 0x000000d8ffc000 flags: 0x0
[    5.166359] DMAR: dmar1: reg_base_addr d8ffc000 ver 1:0 cap 8d2078c106f0466 ecap f020df
[    5.174375] DMAR: DRHD base: 0x000000fbffc000 flags: 0x0
[    5.179716] DMAR: dmar2: reg_base_addr fbffc000 ver 1:0 cap 8d2078c106f0466 ecap f020df
[    5.187730] DMAR: DRHD base: 0x00000092ffc000 flags: 0x1
[    5.193057] DMAR: dmar3: reg_base_addr 92ffc000 ver 1:0 cap 8d2078c106f0466 ecap f020df
[    5.201072] DMAR: RMRR base: 0x0000004d397000 end: 0x0000004d399fff
[    5.207352] DMAR: ATSR flags: 0x0
[    5.210773] DMAR: dmar2: Using Queued invalidation
[    5.215584] DMAR: dmar3: Using Queued invalidation
[    5.220437] DMAR: Hardware identity mapping for device 0000:00:00.0
[    5.226718] DMAR: Hardware identity mapping for device 0000:00:04.0
[    5.232997] DMAR: Hardware identity mapping for device 0000:00:04.1
[    5.239275] DMAR: Hardware identity mapping for device 0000:00:04.2
[    5.245554] DMAR: Hardware identity mapping for device 0000:00:04.3
[    5.251833] DMAR: Hardware identity mapping for device 0000:00:04.4
[    5.258112] DMAR: Hardware identity mapping for device 0000:00:04.5
[    5.264392] DMAR: Hardware identity mapping for device 0000:00:04.6
[    5.270671] DMAR: Hardware identity mapping for device 0000:00:04.7
[    5.276950] DMAR: Hardware identity mapping for device 0000:00:05.0
[    5.283229] DMAR: Hardware identity mapping for device 0000:00:05.2
[    5.289509] DMAR: Hardware identity mapping for device 0000:00:05.4
[    5.295787] DMAR: Hardware identity mapping for device 0000:00:08.0
[    5.302066] DMAR: Hardware identity mapping for device 0000:00:08.1
[    5.308345] DMAR: Hardware identity mapping for device 0000:00:08.2
[    5.314625] DMAR: Hardware identity mapping for device 0000:00:14.0
[    5.320903] DMAR: Hardware identity mapping for device 0000:00:14.2
[    5.327182] DMAR: Hardware identity mapping for device 0000:00:16.0
[    5.333463] DMAR: Hardware identity mapping for device 0000:00:17.0
[    5.339742] DMAR: Hardware identity mapping for device 0000:00:1c.0
[    5.346022] DMAR: Hardware identity mapping for device 0000:00:1c.4
[    5.352299] DMAR: Hardware identity mapping for device 0000:00:1c.6
[    5.358578] DMAR: Hardware identity mapping for device 0000:00:1f.0
[    5.364857] DMAR: Hardware identity mapping for device 0000:00:1f.2
[    5.371136] DMAR: Hardware identity mapping for device 0000:00:1f.3
[    5.377417] DMAR: Hardware identity mapping for device 0000:00:1f.4
[    5.383699] DMAR: Hardware identity mapping for device 0000:02:00.0
[    5.389985] DMAR: Hardware identity mapping for device 0000:03:00.0
[    5.396264] DMAR: Hardware identity mapping for device 0000:16:05.0
[    5.402542] DMAR: Hardware identity mapping for device 0000:16:05.2
[    5.408821] DMAR: Hardware identity mapping for device 0000:16:05.4
[    5.415100] DMAR: Hardware identity mapping for device 0000:16:08.0
[    5.421378] DMAR: Hardware identity mapping for device 0000:16:08.1
[    5.427658] DMAR: Hardware identity mapping for device 0000:16:08.2
[    5.433936] DMAR: Hardware identity mapping for device 0000:16:08.3
[    5.440215] DMAR: Hardware identity mapping for device 0000:16:08.4
[    5.446494] DMAR: Hardware identity mapping for device 0000:16:08.5
[    5.452775] DMAR: Hardware identity mapping for device 0000:16:08.6
[    5.459053] DMAR: Hardware identity mapping for device 0000:16:08.7
[    5.465333] DMAR: Hardware identity mapping for device 0000:16:09.0
[    5.471612] DMAR: Hardware identity mapping for device 0000:16:09.1
[    5.477890] DMAR: Hardware identity mapping for device 0000:16:0e.0
[    5.484169] DMAR: Hardware identity mapping for device 0000:16:0e.1
[    5.490448] DMAR: Hardware identity mapping for device 0000:16:0e.2
[    5.496727] DMAR: Hardware identity mapping for device 0000:16:0e.3
[    5.503028] DMAR: Hardware identity mapping for device 0000:16:0e.4
[    5.509307] DMAR: Hardware identity mapping for device 0000:16:0e.5
[    5.515586] DMAR: Hardware identity mapping for device 0000:16:0e.6
[    5.521865] DMAR: Hardware identity mapping for device 0000:16:0e.7
[    5.528144] DMAR: Hardware identity mapping for device 0000:16:0f.0
[    5.534423] DMAR: Hardware identity mapping for device 0000:16:0f.1
[    5.540704] DMAR: Hardware identity mapping for device 0000:16:1d.0
[    5.546982] DMAR: Hardware identity mapping for device 0000:16:1d.1
[    5.553261] DMAR: Hardware identity mapping for device 0000:16:1d.2
[    5.559539] DMAR: Hardware identity mapping for device 0000:16:1d.3
[    5.565819] DMAR: Hardware identity mapping for device 0000:16:1e.0
[    5.572100] DMAR: Hardware identity mapping for device 0000:16:1e.1
[    5.578377] DMAR: Hardware identity mapping for device 0000:16:1e.2
[    5.584656] DMAR: Hardware identity mapping for device 0000:16:1e.3
[    5.590937] DMAR: Hardware identity mapping for device 0000:16:1e.4
[    5.597216] DMAR: Hardware identity mapping for device 0000:16:1e.5
[    5.603495] DMAR: Hardware identity mapping for device 0000:16:1e.6
[    5.609775] DMAR: Hardware identity mapping for device 0000:64:05.0
[    5.616054] DMAR: Hardware identity mapping for device 0000:64:05.2
[    5.622331] DMAR: Hardware identity mapping for device 0000:64:05.4
[    5.628610] DMAR: Hardware identity mapping for device 0000:64:08.0
[    5.634890] DMAR: Hardware identity mapping for device 0000:64:09.0
[    5.641168] DMAR: Hardware identity mapping for device 0000:64:0a.0
[    5.647447] DMAR: Hardware identity mapping for device 0000:64:0a.1
[    5.653726] DMAR: Hardware identity mapping for device 0000:64:0a.2
[    5.660028] DMAR: Hardware identity mapping for device 0000:64:0a.3
[    5.666307] DMAR: Hardware identity mapping for device 0000:64:0a.4
[    5.672587] DMAR: Hardware identity mapping for device 0000:64:0a.5
[    5.678866] DMAR: Hardware identity mapping for device 0000:64:0a.6
[    5.685145] DMAR: Hardware identity mapping for device 0000:64:0a.7
[    5.691424] DMAR: Hardware identity mapping for device 0000:64:0b.0
[    5.697703] DMAR: Hardware identity mapping for device 0000:64:0b.1
[    5.703982] DMAR: Hardware identity mapping for device 0000:64:0b.2
[    5.710262] DMAR: Hardware identity mapping for device 0000:64:0b.3
[    5.716541] DMAR: Hardware identity mapping for device 0000:64:0c.0
[    5.722821] DMAR: Hardware identity mapping for device 0000:64:0c.1
[    5.729097] DMAR: Hardware identity mapping for device 0000:64:0c.2
[    5.735378] DMAR: Hardware identity mapping for device 0000:64:0c.3
[    5.741657] DMAR: Hardware identity mapping for device 0000:64:0c.4
[    5.747937] DMAR: Hardware identity mapping for device 0000:64:0c.5
[    5.754216] DMAR: Hardware identity mapping for device 0000:64:0c.6
[    5.760493] DMAR: Hardware identity mapping for device 0000:64:0c.7
[    5.766773] DMAR: Hardware identity mapping for device 0000:64:0d.0
[    5.773052] DMAR: Hardware identity mapping for device 0000:64:0d.1
[    5.779331] DMAR: Hardware identity mapping for device 0000:64:0d.2
[    5.785611] DMAR: Hardware identity mapping for device 0000:64:0d.3
[    5.791891] DMAR: Hardware identity mapping for device 0000:b2:00.0
[    5.798170] DMAR: Hardware identity mapping for device 0000:b2:01.0
[    5.804451] DMAR: Hardware identity mapping for device 0000:b2:02.0
[    5.810731] DMAR: Hardware identity mapping for device 0000:b2:05.0
[    5.817032] DMAR: Hardware identity mapping for device 0000:b2:05.2
[    5.823311] DMAR: Hardware identity mapping for device 0000:b2:05.4
[    5.829591] DMAR: Hardware identity mapping for device 0000:b2:12.0
[    5.835870] DMAR: Hardware identity mapping for device 0000:b2:12.1
[    5.842149] DMAR: Hardware identity mapping for device 0000:b2:12.2
[    5.848427] DMAR: Hardware identity mapping for device 0000:b2:15.0
[    5.854706] DMAR: Hardware identity mapping for device 0000:b2:16.0
[    5.860985] DMAR: Hardware identity mapping for device 0000:b2:16.4
[    5.867266] DMAR: Hardware identity mapping for device 0000:b2:17.0
[    5.873548] DMAR: Hardware identity mapping for device 0000:b3:00.0
[    5.879831] DMAR: Hardware identity mapping for device 0000:b4:00.0
[    5.886111] DMAR: Hardware identity mapping for device 0000:b5:00.0
[    5.892389] DMAR: Setting RMRR:
[    5.895548] DMAR: Ignoring identity map for HW passthrough device 0000:00:14.0 [0x4d397000 - 0x4d399fff]
[    5.905034] DMAR: Prepare 0-16MiB unity mapping for LPC
[    5.910272] DMAR: Ignoring identity map for HW passthrough device 0000:00:1f.0 [0x0 - 0xffffff]
[    5.919035] DMAR: Intel(R) Virtualization Technology for Directed I/O
[    5.925523] iommu: Adding device 0000:00:00.0 to group 0
[    5.930917] iommu: Adding device 0000:00:04.0 to group 1
[    5.936255] iommu: Adding device 0000:00:04.1 to group 1
[    5.941588] iommu: Adding device 0000:00:04.2 to group 1
[    5.946919] iommu: Adding device 0000:00:04.3 to group 1
[    5.952253] iommu: Adding device 0000:00:04.4 to group 1
[    5.957588] iommu: Adding device 0000:00:04.5 to group 1
[    5.962916] iommu: Adding device 0000:00:04.6 to group 1
[    5.968252] iommu: Adding device 0000:00:04.7 to group 1
[    5.973606] iommu: Adding device 0000:00:05.0 to group 2
[    5.978938] iommu: Adding device 0000:00:05.2 to group 2
[    5.984271] iommu: Adding device 0000:00:05.4 to group 2
[    5.989625] iommu: Adding device 0000:00:08.0 to group 3
[    5.994958] iommu: Adding device 0000:00:08.1 to group 3
[    6.000293] iommu: Adding device 0000:00:08.2 to group 3
[    6.005641] iommu: Adding device 0000:00:14.0 to group 4
[    6.010968] iommu: Adding device 0000:00:14.2 to group 4
[    6.016311] iommu: Adding device 0000:00:16.0 to group 5
[    6.021646] iommu: Adding device 0000:00:17.0 to group 6
[    6.026978] iommu: Adding device 0000:00:1c.0 to group 7
[    6.032313] iommu: Adding device 0000:00:1c.4 to group 8
[    6.037648] iommu: Adding device 0000:00:1c.6 to group 9
[    6.043030] iommu: Adding device 0000:00:1f.0 to group 10
[    6.048453] iommu: Adding device 0000:00:1f.2 to group 10
[    6.053875] iommu: Adding device 0000:00:1f.3 to group 10
[    6.059296] iommu: Adding device 0000:00:1f.4 to group 10
[    6.064718] iommu: Adding device 0000:02:00.0 to group 11
[    6.070135] iommu: Adding device 0000:03:00.0 to group 12
[    6.075577] iommu: Adding device 0000:16:05.0 to group 13
[    6.081022] iommu: Adding device 0000:16:05.2 to group 13
[    6.086450] iommu: Adding device 0000:16:05.4 to group 13
[    6.091923] iommu: Adding device 0000:16:08.0 to group 14
[    6.097344] iommu: Adding device 0000:16:08.1 to group 14
[    6.102761] iommu: Adding device 0000:16:08.2 to group 14
[    6.108182] iommu: Adding device 0000:16:08.3 to group 14
[    6.113604] iommu: Adding device 0000:16:08.4 to group 14
[    6.119030] iommu: Adding device 0000:16:08.5 to group 14
[    6.124454] iommu: Adding device 0000:16:08.6 to group 14
[    6.129876] iommu: Adding device 0000:16:08.7 to group 14
[    6.135307] iommu: Adding device 0000:16:09.0 to group 15
[    6.140730] iommu: Adding device 0000:16:09.1 to group 15
[    6.146198] iommu: Adding device 0000:16:0e.0 to group 16
[    6.151621] iommu: Adding device 0000:16:0e.1 to group 16
[    6.157052] iommu: Adding device 0000:16:0e.2 to group 16
[    6.162471] iommu: Adding device 0000:16:0e.3 to group 16
[    6.167892] iommu: Adding device 0000:16:0e.4 to group 16
[    6.173314] iommu: Adding device 0000:16:0e.5 to group 16
[    6.178736] iommu: Adding device 0000:16:0e.6 to group 16
[    6.184159] iommu: Adding device 0000:16:0e.7 to group 16
[    6.189593] iommu: Adding device 0000:16:0f.0 to group 17
[    6.195032] iommu: Adding device 0000:16:0f.1 to group 17
[    6.200482] iommu: Adding device 0000:16:1d.0 to group 18
[    6.205905] iommu: Adding device 0000:16:1d.1 to group 18
[    6.211326] iommu: Adding device 0000:16:1d.2 to group 18
[    6.216747] iommu: Adding device 0000:16:1d.3 to group 18
[    6.222209] iommu: Adding device 0000:16:1e.0 to group 19
[    6.227635] iommu: Adding device 0000:16:1e.1 to group 19
[    6.233062] iommu: Adding device 0000:16:1e.2 to group 19
[    6.238481] iommu: Adding device 0000:16:1e.3 to group 19
[    6.243905] iommu: Adding device 0000:16:1e.4 to group 19
[    6.249326] iommu: Adding device 0000:16:1e.5 to group 19
[    6.254749] iommu: Adding device 0000:16:1e.6 to group 19
[    6.260191] iommu: Adding device 0000:64:05.0 to group 20
[    6.265618] iommu: Adding device 0000:64:05.2 to group 20
[    6.271048] iommu: Adding device 0000:64:05.4 to group 20
[    6.276476] iommu: Adding device 0000:64:08.0 to group 21
[    6.281906] iommu: Adding device 0000:64:09.0 to group 22
[    6.287386] iommu: Adding device 0000:64:0a.0 to group 23
[    6.292808] iommu: Adding device 0000:64:0a.1 to group 23
[    6.298230] iommu: Adding device 0000:64:0a.2 to group 23
[    6.303656] iommu: Adding device 0000:64:0a.3 to group 23
[    6.309081] iommu: Adding device 0000:64:0a.4 to group 23
[    6.314504] iommu: Adding device 0000:64:0a.5 to group 23
[    6.319929] iommu: Adding device 0000:64:0a.6 to group 23
[    6.325353] iommu: Adding device 0000:64:0a.7 to group 23
[    6.330798] iommu: Adding device 0000:64:0b.0 to group 24
[    6.336223] iommu: Adding device 0000:64:0b.1 to group 24
[    6.341648] iommu: Adding device 0000:64:0b.2 to group 24
[    6.347074] iommu: Adding device 0000:64:0b.3 to group 24
[    6.352551] iommu: Adding device 0000:64:0c.0 to group 25
[    6.357976] iommu: Adding device 0000:64:0c.1 to group 25
[    6.363401] iommu: Adding device 0000:64:0c.2 to group 25
[    6.368828] iommu: Adding device 0000:64:0c.3 to group 25
[    6.374247] iommu: Adding device 0000:64:0c.4 to group 25
[    6.379673] iommu: Adding device 0000:64:0c.5 to group 25
[    6.385100] iommu: Adding device 0000:64:0c.6 to group 25
[    6.390519] iommu: Adding device 0000:64:0c.7 to group 25
[    6.395970] iommu: Adding device 0000:64:0d.0 to group 26
[    6.401398] iommu: Adding device 0000:64:0d.1 to group 26
[    6.406820] iommu: Adding device 0000:64:0d.2 to group 26
[    6.412243] iommu: Adding device 0000:64:0d.3 to group 26
[    6.417663] iommu: Adding device 0000:b2:00.0 to group 27
[    6.423085] iommu: Adding device 0000:b2:01.0 to group 28
[    6.428507] iommu: Adding device 0000:b2:02.0 to group 29
[    6.433949] iommu: Adding device 0000:b2:05.0 to group 30
[    6.439376] iommu: Adding device 0000:b2:05.2 to group 30
[    6.444802] iommu: Adding device 0000:b2:05.4 to group 30
[    6.450240] iommu: Adding device 0000:b2:12.0 to group 31
[    6.455666] iommu: Adding device 0000:b2:12.1 to group 31
[    6.461094] iommu: Adding device 0000:b2:12.2 to group 31
[    6.466516] iommu: Adding device 0000:b2:15.0 to group 32
[    6.471950] iommu: Adding device 0000:b2:16.0 to group 33
[    6.477374] iommu: Adding device 0000:b2:16.4 to group 33
[    6.482797] iommu: Adding device 0000:b2:17.0 to group 34
[    6.488218] iommu: Adding device 0000:b3:00.0 to group 35
[    6.493640] iommu: Adding device 0000:b4:00.0 to group 36
[    6.499069] iommu: Adding device 0000:b5:00.0 to group 37
[    6.505573] RAPL PMU: API unit is 2^-32 Joules, 3 fixed counters, 655360 ms ovfl timer
[    6.513498] RAPL PMU: hw unit of domain pp0-core 2^-14 Joules
[    6.519251] RAPL PMU: hw unit of domain package 2^-14 Joules
[    6.524919] RAPL PMU: hw unit of domain dram 2^-16 Joules
[    6.530861] Machine check injector initialized
[    6.536036] Scanning for low memory corruption every 60 seconds
[    6.542242] audit: initializing netlink subsys (disabled)
[    6.547720] audit: type=2000 audit(1565419566.547:1): state=initialized audit_enabled=0 res=1
[    6.548230] workingset: timestamp_bits=46 max_order=23 bucket_order=0
[    6.562828] zbud: loaded
[    6.565557] FS-Cache: Netfs 'nfs' registered for caching
[    6.570935] NFS: Registering the id_resolver key type
[    6.576032] Key type id_resolver registered
[    6.580236] Key type id_legacy registered
[    6.584263] Installing knfsd (copyright (C) 1996 okir@monad.swb.de).
[    6.590768] Key type cifs.spnego registered
[    6.594996] fuse init (API version 7.26)
[    6.601641] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 248)
[    6.609100] io scheduler noop registered
[    6.613045] io scheduler deadline registered
[    6.617333] io scheduler cfq registered (default)
[    6.622053] io scheduler mq-deadline registered
[    6.626594] io scheduler kyber registered
[    6.631601] pcieport 0000:00:1c.0: Signaling PME with IRQ 26
[    6.637296] pcieport 0000:00:1c.4: Signaling PME with IRQ 27
[    6.642995] pcieport 0000:00:1c.6: Signaling PME with IRQ 28
[    6.648682] pcieport 0000:b2:00.0: Signaling PME with IRQ 30
[    6.654365] pcieport 0000:b2:01.0: Signaling PME with IRQ 31
[    6.660057] pcieport 0000:b2:02.0: Signaling PME with IRQ 32
[    6.665741] pciehp 0000:00:1c.0:pcie004: Slot #0 AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl+ LLActRep+
[    6.678131] pciehp 0000:b2:00.0:pcie004: Slot #0 AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl- LLActRep+
[    6.690501] pciehp 0000:b2:01.0:pcie004: Slot #0 AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl- LLActRep+
[    6.702918] input: Sleep Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0E:00/input/input0
[    6.711286] ACPI: Sleep Button [SLPB]
[    6.714998] input: Power Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/input1
[    6.723370] ACPI: Power Button [PWRB]
[    6.727063] input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/input/input2
[    6.734490] ACPI: Power Button [PWRF]
[    6.739663] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
▒[    6.766590] 00:03: ttyS0 at I/O 0x3f8 (irq = 4, base_baud = 115200) is a 16550A
[    6.794625] 00:04: ttyS1 at I/O 0x2f8 (irq = 3, base_baud = 115200) is a 16550A
[    6.823027] 00:06: ttyS2 at I/O 0x3e8 (irq = 11, base_baud = 115200) is a 16550A
[    6.830806] Non-volatile memory driver v1.3
[    6.835138] Linux agpgart interface v0.103
[    6.839295] AMD IOMMUv2 driver by Joerg Roedel <jroedel@suse.de>
[    6.845324] AMD IOMMUv2 functionality not available on this system
[    6.853254] brd: module loaded
[    6.887463] loop: module loaded
[    6.892929] rdac: device handler registered
[    6.897219] SCSI Media Changer driver v0.25
[    6.901754] nvme nvme0: pci function 0000:b3:00.0
[    6.906571] nvme nvme1: pci function 0000:b4:00.0
[    6.912488] ahci 0000:00:17.0: AHCI 0001.0301 32 slots 8 ports 6 Gbps 0xff impl SATA mode
[    6.920673] ahci 0000:00:17.0: flags: 64bit ncq sntf pm led clo only pio slum part ems deso sadm sds apst
[    7.122320]  nvme1n1: p1 p2 p3 p4 p5
[    7.122334]  nvme0n1: p1 p2 p3 p4 p5
[    7.346615] scsi host0: ahci
[    7.349658] scsi host1: ahci
[    7.352684] scsi host2: ahci
[    7.355720] scsi host3: ahci
[    7.358741] scsi host4: ahci
[    7.361756] scsi host5: ahci
[    7.364779] scsi host6: ahci
[    7.367781] scsi host7: ahci
[    7.370711] ata1: SATA max UDMA/133 abar m2048@0x92f4b000 port 0x92f4b100 irq 37
[    7.378122] ata2: SATA max UDMA/133 abar m2048@0x92f4b000 port 0x92f4b180 irq 37
[    7.385524] ata3: SATA max UDMA/133 abar m2048@0x92f4b000 port 0x92f4b200 irq 37
[    7.392924] ata4: SATA max UDMA/133 abar m2048@0x92f4b000 port 0x92f4b280 irq 37
[    7.400325] ata5: SATA max UDMA/133 abar m2048@0x92f4b000 port 0x92f4b300 irq 37
[    7.407727] ata6: SATA max UDMA/133 abar m2048@0x92f4b000 port 0x92f4b380 irq 37
[    7.415129] ata7: SATA max UDMA/133 abar m2048@0x92f4b000 port 0x92f4b400 irq 37
[    7.422530] ata8: SATA max UDMA/133 abar m2048@0x92f4b000 port 0x92f4b480 irq 37
[    7.430060] i8042: PNP: No PS/2 controller found.
[    7.434835] mousedev: PS/2 mouse device common for all mice
[    7.440617] rtc_cmos 00:00: RTC can wake from S4
[    7.445642] rtc_cmos 00:00: rtc core: registered rtc_cmos as rtc0
[    7.451829] rtc_cmos 00:00: alarms up to one month, y3k, 114 bytes nvram, hpet irqs
[    7.459501] i2c /dev entries driver
[    7.463140] i801_smbus 0000:00:1f.4: SPD Write Disable is set
[    7.468917] i801_smbus 0000:00:1f.4: SMBus using PCI interrupt
[    7.475812] [i2c-mv9235.ko]: Module init
[    7.479767] lirc_dev: IR Remote Control driver registered, major 246
[    7.486135] IR RC6 protocol handler initialized
[    7.490676] IR MCE Keyboard/mouse protocol handler initialized
[    7.496518] IR LIRC bridge handler initialized
[    7.501361] device-mapper: ioctl: 4.37.0-ioctl (2017-09-20) initialised: dm-devel@redhat.com
[    7.509979] device-mapper: multipath round-robin: version 1.2.0 loaded
[    7.516526] device-mapper: multipath queue-length: version 0.2.0 loaded
[    7.523148] device-mapper: multipath service-time: version 0.3.0 loaded
[    7.529778] usbcore: registered new interface driver btusb
[    7.535286] intel_pstate: Intel P-state driver initializing
[    7.541911] intel_pstate: HWP enabled
[    7.545599] sdhci: Secure Digital Host Controller Interface driver
[    7.551800] sdhci: Copyright(c) Pierre Ossman
[    7.556195] wbsd: Winbond W83L51xD SD/MMC card interface driver
[    7.562131] wbsd: Copyright(c) Pierre Ossman
[    7.566426] hidraw: raw HID events driver (C) Jiri Kosina
[    7.571899] usbcore: registered new interface driver usbhid
[    7.577489] usbhid: USB HID core driver
[    7.581809] Netfilter messages via NETLINK v0.30.
[    7.584053] tsc: Refined TSC clocksource calibration: 3600.011 MHz
[    7.584094] clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x33e45d8079c, max_idle_ns: 440795324677 ns
[    7.602822] nf_conntrack version 0.5.0 (65536 buckets, 262144 max)
[    7.605050] snd_hda_intel 0000:00:1f.3: no codecs found!
[    7.614368] ctnetlink v0.93: registering with nfnetlink.
[    7.619733] ip_tables: (C) 2000-2006 Netfilter Core Team
[    7.625084] Initializing XFRM netlink socket
[    7.629367] NET: Registered protocol family 17
[    7.633838] NET: Registered protocol family 5
[    7.638217] Key type dns_resolver registered
[    7.643067] microcode: sig=0x50654, pf=0x2, revision=0x200005e
[    7.649033] microcode: Microcode Update Driver: v2.2.
[    7.649038] AVX2 version of gcm_enc/dec engaged.
[    7.658736] AES CTR mode by8 optimization enabled
[    7.664621] sched_clock: Marking stable (7664614558, 0)->(7941086399, -276471841)
[    7.672212] registered taskstats version 1
[    7.676372] zswap: loaded using pool lz4/zbud
[    7.680764] raid6test: testing the 4-disk case...
[    7.685560] raid6test: testing the 5-disk case...
[    7.690414] raid6test: testing the 11-disk case...
[    7.695821] raid6test: testing the 12-disk case...
[    7.701405] raid6test: testing the 24-disk case...
[    7.709947] raid6test: testing the 64-disk case...
[    7.740555] ata5: SATA link up 6.0 Gbps (SStatus 133 SControl 330)
[    7.746758] ata7: SATA link up 6.0 Gbps (SStatus 133 SControl 330)
[    7.752968] ata3: SATA link up 6.0 Gbps (SStatus 133 SControl 330)
[    7.758416] raid6test:
[    7.758416] raid6test: complete (2429 tests, 0 failures)
[    7.759140]   Magic number: 15:632:771
[    7.759195] bdi 7:105: hash matches
[    7.759265] pci 0000:00:05.2: hash matches
[    7.759331] ALSA device list:
[    7.759332]   No soundcards found.
[    7.784714] ata1: SATA link up 6.0 Gbps (SStatus 133 SControl 330)
[    7.790960] ata8: SATA link up 6.0 Gbps (SStatus 133 SControl 330)
[    7.797169] ata2: SATA link up 6.0 Gbps (SStatus 133 SControl 330)
[    7.803374] ata4: SATA link up 6.0 Gbps (SStatus 133 SControl 330)
[    7.809574] ata6: SATA link up 6.0 Gbps (SStatus 133 SControl 330)
[    7.815933] ata7.00: ATA-8: WDC WD5003ABYZ-011FA0, 01.01S03, max UDMA/133
[    7.822729] ata7.00: 976773168 sectors, multi 16: LBA48 NCQ (depth 31/32), AA
[    7.829874] ata8.00: ATA-8: WDC WD5003ABYZ-011FA0, 01.01S03, max UDMA/133
[    7.836673] ata8.00: 976773168 sectors, multi 16: LBA48 NCQ (depth 31/32), AA
[    7.843817] ata3.00: ATA-8: WDC WD5003ABYZ-011FA0, 01.01S03, max UDMA/133
[    7.850622] ata3.00: 976773168 sectors, multi 16: LBA48 NCQ (depth 31/32), AA
[    7.857772] ata2.00: ATA-8: WDC WD5003ABYZ-011FA0, 01.01S03, max UDMA/133
[    7.864564] ata2.00: 976773168 sectors, multi 16: LBA48 NCQ (depth 31/32), AA
[    7.871702] ata5.00: ATA-8: WDC WD5003ABYZ-011FA0, 01.01S03, max UDMA/133
[    7.878501] ata5.00: 976773168 sectors, multi 16: LBA48 NCQ (depth 31/32), AA
[    7.885639] ata1.00: ATA-8: WDC WD5003ABYZ-011FA0, 01.01S03, max UDMA/133
[    7.892439] ata1.00: 976773168 sectors, multi 16: LBA48 NCQ (depth 31/32), AA
[    7.899581] ata4.00: ATA-8: WDC WD5003ABYZ-011FA0, 01.01S03, max UDMA/133
[    7.906380] ata4.00: 976773168 sectors, multi 16: LBA48 NCQ (depth 31/32), AA
[    7.913519] ata6.00: ATA-8: WDC WD5003ABYZ-011FA0, 01.01S03, max UDMA/133
[    7.920316] ata6.00: 976773168 sectors, multi 16: LBA48 NCQ (depth 31/32), AA
[    7.928091] ata4.00: configured for UDMA/133
[    7.932394] ata6.00: configured for UDMA/133
[    7.936744] ata2.00: configured for UDMA/133
[    7.941035] ata3.00: configured for UDMA/133
[    7.945316] ata8.00: configured for UDMA/133
[    7.949604] ata1.00: configured for UDMA/133
[    7.953898] ata5.00: configured for UDMA/133
[    7.958204] ata7.00: configured for UDMA/133
[    8.270597] ata3: SATA link up 6.0 Gbps (SStatus 133 SControl 330)
[    8.276810] ata8: SATA link up 6.0 Gbps (SStatus 133 SControl 330)
[    8.283035] ata4: SATA link up 6.0 Gbps (SStatus 133 SControl 330)
[    8.289241] ata1: SATA link up 6.0 Gbps (SStatus 133 SControl 330)
[    8.295448] ata6: SATA link up 6.0 Gbps (SStatus 133 SControl 330)
[    8.301657] ata5: SATA link up 6.0 Gbps (SStatus 133 SControl 330)
[    8.307878] ata2: SATA link up 6.0 Gbps (SStatus 133 SControl 330)
[    8.314096] ata7: SATA link up 6.0 Gbps (SStatus 133 SControl 330)
[    8.321178] ata4.00: configured for UDMA/133
[    8.325527] ata6.00: configured for UDMA/133
[    8.329905] ata5.00: configured for UDMA/133
[    8.334197] ata8.00: configured for UDMA/133
[    8.338547] ata2.00: configured for UDMA/133
[    8.342834] ata3.00: configured for UDMA/133
[    8.347122] ata1.00: configured for UDMA/133
[    8.351547] ata7.00: configured for UDMA/133
[    8.351649] Check proc_name[ahci].
[    8.351652] scsi 0:0:0:0: Direct-Access     WDC      WD5003ABYZ-011FA 01.0 PQ: 0 ANSI: 5
[    8.351653] ata1.00: set queue depth = 31
[    8.351766] Check proc_name[ahci].
[    8.351769] Check proc_name[ahci].
[    8.351769] Check proc_name[ahci].
[    8.351783] Check proc_name[ahci].
[    8.351790] Check proc_name[ahci].
[    8.351821] sd 0:0:0:0: Attached scsi generic sg0 type 0
[    8.351930] sd 0:0:0:0: [sda] 976773168 512-byte logical blocks: (500 GB/466 GiB)
[    8.351956] sd 0:0:0:0: [sda] Write Protect is off
[    8.351988] Check proc_name[ahci].
[    8.351989] scsi 1:0:0:0: Direct-Access     WDC      WD5003ABYZ-011FA 01.0 PQ: 0 ANSI: 5
[    8.351991] ata2.00: set queue depth = 31
[    8.351992] sd 0:0:0:0: [sda] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
[    8.352042] Check proc_name[ahci].
[    8.352044] Check proc_name[ahci].
[    8.352044] Check proc_name[ahci].
[    8.352055] Check proc_name[ahci].
[    8.352068] Check proc_name[ahci].
[    8.352115] sd 1:0:0:0: Attached scsi generic sg1 type 0
[    8.352175] sd 1:0:0:0: [sdb] 976773168 512-byte logical blocks: (500 GB/466 GiB)
[    8.352192] sd 1:0:0:0: [sdb] Write Protect is off
[    8.352227] sd 1:0:0:0: [sdb] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
[    8.352291] Check proc_name[ahci].
[    8.352293] scsi 2:0:0:0: Direct-Access     WDC      WD5003ABYZ-011FA 01.0 PQ: 0 ANSI: 5
[    8.352294] ata3.00: set queue depth = 31
[    8.352379] Check proc_name[ahci].
[    8.352382] Check proc_name[ahci].
[    8.352382] Check proc_name[ahci].
[    8.352396] Check proc_name[ahci].
[    8.352408] Check proc_name[ahci].
[    8.352417] sd 2:0:0:0: [sdc] 976773168 512-byte logical blocks: (500 GB/466 GiB)
[    8.352419] sd 2:0:0:0: [sdc] Write Protect is off
[    8.352425] sd 2:0:0:0: [sdc] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
[    8.352439] sd 2:0:0:0: Attached scsi generic sg2 type 0
[    8.352633] Check proc_name[ahci].
[    8.352634] scsi 3:0:0:0: Direct-Access     WDC      WD5003ABYZ-011FA 01.0 PQ: 0 ANSI: 5
[    8.352635] ata4.00: set queue depth = 31
[    8.352709] Check proc_name[ahci].
[    8.352711] Check proc_name[ahci].
[    8.352711] Check proc_name[ahci].
[    8.352724] Check proc_name[ahci].
[    8.352734] Check proc_name[ahci].
[    8.352759] sd 3:0:0:0: Attached scsi generic sg3 type 0
[    8.352810] sd 3:0:0:0: [sdd] 976773168 512-byte logical blocks: (500 GB/466 GiB)
[    8.352828] sd 3:0:0:0: [sdd] Write Protect is off
[    8.352859] sd 3:0:0:0: [sdd] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
[    8.352926] Check proc_name[ahci].
[    8.352928] scsi 4:0:0:0: Direct-Access     WDC      WD5003ABYZ-011FA 01.0 PQ: 0 ANSI: 5
[    8.352929] ata5.00: set queue depth = 31
[    8.352997] Check proc_name[ahci].
[    8.353013] Check proc_name[ahci].
[    8.353013] Check proc_name[ahci].
[    8.353027] Check proc_name[ahci].
[    8.353039] Check proc_name[ahci].
[    8.353073] sd 4:0:0:0: Attached scsi generic sg4 type 0
[    8.353136] sd 4:0:0:0: [sde] 976773168 512-byte logical blocks: (500 GB/466 GiB)
[    8.353152] sd 4:0:0:0: [sde] Write Protect is off
[    8.353189] sd 4:0:0:0: [sde] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
[    8.353253] Check proc_name[ahci].
[    8.353255] scsi 5:0:0:0: Direct-Access     WDC      WD5003ABYZ-011FA 01.0 PQ: 0 ANSI: 5
[    8.353255] ata6.00: set queue depth = 31
[    8.353324] Check proc_name[ahci].
[    8.353326] Check proc_name[ahci].
[    8.353326] Check proc_name[ahci].
[    8.353335] Check proc_name[ahci].
[    8.353345] Check proc_name[ahci].
[    8.353366] sd 5:0:0:0: Attached scsi generic sg5 type 0
[    8.353433] sd 5:0:0:0: [sdf] 976773168 512-byte logical blocks: (500 GB/466 GiB)
[    8.353450] sd 5:0:0:0: [sdf] Write Protect is off
[    8.353484] sd 5:0:0:0: [sdf] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
[    8.396361]  sdc: sdc1 sdc2 sdc3 sdc4 sdc5
[    8.396797] sd 2:0:0:0: [sdc] Attached SCSI disk
[    8.396797] Check proc_name[ahci].
[    8.397910]  sdb: sdb1 sdb2 sdb3 sdb4 sdb5
[    8.398350] sd 1:0:0:0: [sdb] Attached SCSI disk
[    8.398350] Check proc_name[ahci].
[    8.400478]  sdf: sdf1 sdf2 sdf3 sdf4 sdf5
[    8.400837]  sdd: sdd1 sdd2 sdd3 sdd4 sdd5
[    8.400919] sd 5:0:0:0: [sdf] Attached SCSI disk
[    8.400919] Check proc_name[ahci].
[    8.401261] sd 3:0:0:0: [sdd] Attached SCSI disk
[    8.401262] Check proc_name[ahci].
[    8.404701]  sde: sde1 sde2 sde3 sde4 sde5
[    8.405140] sd 4:0:0:0: [sde] Attached SCSI disk
[    8.405140] Check proc_name[ahci].
[    8.405318]  sda: sda1 sda2 sda3 sda4 sda5
[    8.405735] sd 0:0:0:0: [sda] Attached SCSI disk
[    8.405735] Check proc_name[ahci].
[    8.783952] clocksource: Switched to clocksource tsc
[    8.784036] Check proc_name[ahci].
[    8.784038] scsi 6:0:0:0: Direct-Access     WDC      WD5003ABYZ-011FA 01.0 PQ: 0 ANSI: 5
[    8.784039] ata7.00: set queue depth = 31
[    8.784082] Check proc_name[ahci].
[    8.784084] Check proc_name[ahci].
[    8.784085] Check proc_name[ahci].
[    8.784093] Check proc_name[ahci].
[    8.784105] Check proc_name[ahci].
[    8.784121] sd 6:0:0:0: Attached scsi generic sg6 type 0
[    8.784142] sd 6:0:0:0: [sdg] 976773168 512-byte logical blocks: (500 GB/466 GiB)
[    8.784148] sd 6:0:0:0: [sdg] Write Protect is off
[    8.784161] sd 6:0:0:0: [sdg] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
[    8.784176] Check proc_name[ahci].
[    8.784178] scsi 7:0:0:0: Direct-Access     WDC      WD5003ABYZ-011FA 01.0 PQ: 0 ANSI: 5
[    8.784179] ata8.00: set queue depth = 31
[    8.784223] Check proc_name[ahci].
[    8.784226] Check proc_name[ahci].
[    8.784227] Check proc_name[ahci].
[    8.784237] Check proc_name[ahci].
[    8.784246] Check proc_name[ahci].
[    8.784264] sd 7:0:0:0: Attached scsi generic sg7 type 0
[    8.784277] sd 7:0:0:0: [sdh] 976773168 512-byte logical blocks: (500 GB/466 GiB)
[    8.784283] sd 7:0:0:0: [sdh] Write Protect is off
[    8.784295] sd 7:0:0:0: [sdh] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
[    8.837378]  sdh: sdh1 sdh2 sdh3 sdh4 sdh5
[    8.837532] sd 7:0:0:0: [sdh] Attached SCSI disk
[    8.837532] Check proc_name[ahci].
[    8.838335]  sdg: sdg1 sdg2 sdg3 sdg4 sdg5
[    8.838487] sd 6:0:0:0: [sdg] Attached SCSI disk
[    8.838487] Check proc_name[ahci].
[    8.851796] Freeing unused kernel memory: 1468K
[    8.851796] Write protecting the kernel read-only data: 18432k
[    8.873711] Freeing unused kernel memory: 2004K
[    8.880413] Freeing unused kernel memory: 736K
[    9.047231] RTC_TIME:Sat Aug 10 06:46:10 2019  0.000000 seconds
[    9.053949] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    9.060974] ehci-pci: EHCI PCI platform driver
[    9.066016] uhci_hcd: USB Universal Host Controller Interface driver
[    9.072959] usbcore: registered new interface driver usblp
[    9.080028] xhci_hcd 0000:00:14.0: xHCI Host Controller
[    9.085249] xhci_hcd 0000:00:14.0: new USB bus registered, assigned bus number 1
[    9.093709] xhci_hcd 0000:00:14.0: hcc params 0x200077c1 hci version 0x100 quirks 0x00009810
[    9.102253] hub 1-0:1.0: USB hub found
[    9.106020] hub 1-0:1.0: 16 ports detected
[    9.110746] xhci_hcd 0000:00:14.0: xHCI Host Controller
[    9.115960] xhci_hcd 0000:00:14.0: new USB bus registered, assigned bus number 2
[    9.123448] hub 2-0:1.0: USB hub found
[    9.127202] hub 2-0:1.0: 10 ports detected
[    9.131632] usb: port power management may be unreliable
[    9.137820] usbcore: registered new interface driver usb-storage
[    9.147723] qla2xxx [0000:00:00.0]-0005: : QLogic Fibre Channel HBA Driver: 10.00.00.01-k.
[    9.156485] celerity16fc_cfg: loading out-of-tree module taints kernel.
[    9.163882] celerity16fc: module license 'Proprietary' taints kernel.
[    9.170320] Disabling lock debugging due to kernel taint
[    9.176085] celerity16fc: Driver will not be loaded because no ATTO celerity16fc devices were found
[    9.202366] mpt3sas version 15.100.00.00 loaded
[    9.209516] Marvell Storage Controller is found, using IRQ 54, driver version 6.0.0.1009N.
[    9.217764] Marvell Linux driver mv14xx, driver version 6.0.0.1009N.
[    9.226634] mv_do_test value is 0, mv_int_mode value is 2
[    9.433001] usb 1-9: new high-speed USB device number 2 using xhci_hcd
[    9.494735] CORE EH:
[    9.494736] set_port_vsr_data phy 0 reg 0x102 expect 0x74c5, result 0x74cf
[    9.534132] CORE EH:
[    9.534132] set_port_vsr_data phy 0 reg 0x106 expect 0xc63e, result 0xc600
[    9.553445] CORE EH:
[    9.553445] set_port_vsr_data phy 1 reg 0x102 expect 0x74c5, result 0x74cf
[    9.566524] usb-storage 1-9:1.0: USB Mass Storage device detected
[    9.572639] scsi host9: usb-storage 1-9:1.0
[    9.592843] CORE EH:
[    9.592844] set_port_vsr_data phy 1 reg 0x106 expect 0xc63e, result 0xc600
[    9.612158] CORE EH:
[    9.612159] set_port_vsr_data phy 2 reg 0x102 expect 0x74c5, result 0x74cf
[    9.651556] CORE EH:
[    9.651556] set_port_vsr_data phy 2 reg 0x106 expect 0xc63e, result 0xc600
[    9.670873] CORE EH:
[    9.670873] set_port_vsr_data phy 3 reg 0x102 expect 0x74c5, result 0x74cf
[    9.710273] CORE EH:
[    9.710274] set_port_vsr_data phy 3 reg 0x106 expect 0xc63e, result 0xc600
[    9.729588] CORE EH:
[    9.729589] set_port_vsr_data phy 4 reg 0x102 expect 0x74c5, result 0x74cf
[    9.768984] CORE EH:
[    9.768985] set_port_vsr_data phy 4 reg 0x106 expect 0xc63e, result 0xc600
[    9.788297] CORE EH:
[    9.788298] set_port_vsr_data phy 5 reg 0x102 expect 0x74c5, result 0x74cf
[    9.827696] CORE EH:
[    9.827696] set_port_vsr_data phy 5 reg 0x106 expect 0xc63e, result 0xc600
[    9.847011] CORE EH:
[    9.847011] set_port_vsr_data phy 6 reg 0x102 expect 0x74c6, result 0x74cf
[    9.886407] CORE EH:
[    9.886407] set_port_vsr_data phy 6 reg 0x106 expect 0xc63e, result 0xc600
[    9.905725] CORE EH:
[    9.905725] set_port_vsr_data phy 7 reg 0x102 expect 0x74c6, result 0x74cf
[    9.945121] CORE EH:
[    9.945122] set_port_vsr_data phy 7 reg 0x106 expect 0xc63e, result 0xc600
[   10.591399] Check proc_name[usb-storage].
[   10.595405] scsi 9:0:0:0: Direct-Access              USB DISK MODULE  PMAP PQ: 0 ANSI: 0 CCS
[   10.603851] Check proc_name[usb-storage].
[   10.607853] Check proc_name[usb-storage].
[   10.611852] Check proc_name[usb-storage].
[   10.615864] Check proc_name[usb-storage].
[   10.616712] sd 9:0:0:0: [sdi] 8060928 512-byte logical blocks: (4.13 GB/3.84 GiB)
[   10.616915] CORE EH:
[   10.616916] set_port_vsr_data phy 8 reg 0x102 expect 0x74c5, result 0x74cf
[   10.619412] sd 9:0:0:0: [sdi] Write Protect is off
[   10.622123] sd 9:0:0:0: [sdi] No Caching mode page found
[   10.622124] sd 9:0:0:0: [sdi] Assuming drive cache: write through
[   10.629313]  sdi: sdi1 sdi2 sdi3 sdi4 < sdi5 sdi6 sdi7 >
[   10.636498] sd 9:0:0:0: [sdi] Attached SCSI removable disk
[   10.636499] Check proc_name[usb-storage].
[   10.647100] CORE EH:
[   10.647101] set_port_vsr_data phy 8 reg 0x106 expect 0xc63e, result 0xc600
[   10.657203] CORE EH:
[   10.657203] set_port_vsr_data phy 9 reg 0x102 expect 0x74c5, result 0x74cf
[   10.685911] Check proc_name[usb-storage].
[   10.687388] CORE EH:
[   10.687389] set_port_vsr_data phy 9 reg 0x106 expect 0xc63e, result 0xc600
[   10.697490] CORE EH:
[   10.697491] set_port_vsr_data phy a reg 0x102 expect 0x74c5, result 0x74cf
[   10.708357] sd 9:0:0:0: Attached scsi generic sg8 type 0
[   10.713706] Check proc_name[usb-storage].
[   10.727675] CORE EH:
[   10.727676] set_port_vsr_data phy a reg 0x106 expect 0xc63e, result 0xc600
[   10.746991] CORE EH:
[   10.746992] set_port_vsr_data phy b reg 0x102 expect 0x74c5, result 0x74cf
[   10.786390] CORE EH:
[   10.786391] set_port_vsr_data phy b reg 0x106 expect 0xc63e, result 0xc600
[   10.805706] CORE EH:
[   10.805707] set_port_vsr_data phy c reg 0x102 expect 0x74c5, result 0x74cf
[   10.845102] CORE EH:
[   10.845103] set_port_vsr_data phy c reg 0x106 expect 0xc63e, result 0xc600
[   10.864417] CORE EH:
[   10.864418] set_port_vsr_data phy d reg 0x102 expect 0x74c5, result 0x74cf
[   10.903817] CORE EH:
[   10.903818] set_port_vsr_data phy d reg 0x106 expect 0xc63e, result 0xc600
[   10.923132] CORE EH:
[   10.923133] set_port_vsr_data phy e reg 0x102 expect 0x74c5, result 0x74cf
[   10.962530] CORE EH:
[   10.962530] set_port_vsr_data phy e reg 0x106 expect 0xc63e, result 0xc600
[   10.981845] CORE EH:
[   10.981846] set_port_vsr_data phy f reg 0x102 expect 0x74c5, result 0x74cf
[   11.021243] CORE EH:
[   11.021243] set_port_vsr_data phy f reg 0x106 expect 0xc63e, result 0xc600
[   12.693115] CORE EH:
[   12.693116] set_port_vsr_data phy 0 reg 0x102 expect 0x74c5, result 0x74cf
[   12.732514] CORE EH:
[   12.732514] set_port_vsr_data phy 0 reg 0x106 expect 0xc63e, result 0xc600
[   12.751829] CORE EH:
[   12.751829] set_port_vsr_data phy 1 reg 0x102 expect 0x74c5, result 0x74cf
[   12.791228] CORE EH:
[   12.791228] set_port_vsr_data phy 1 reg 0x106 expect 0xc63e, result 0xc600
[   12.810543] CORE EH:
[   12.810544] set_port_vsr_data phy 2 reg 0x102 expect 0x74c5, result 0x74cf
[   12.849940] CORE EH:
[   12.849940] set_port_vsr_data phy 2 reg 0x106 expect 0xc63e, result 0xc600
[   12.869258] CORE EH:
[   12.869258] set_port_vsr_data phy 3 reg 0x102 expect 0x74c5, result 0x74cf
[   12.908659] CORE EH:
[   12.908659] set_port_vsr_data phy 3 reg 0x106 expect 0xc63e, result 0xc600
[   12.927974] CORE EH:
[   12.927974] set_port_vsr_data phy 4 reg 0x102 expect 0x74c6, result 0x74cf
[   12.967371] CORE EH:
[   12.967371] set_port_vsr_data phy 4 reg 0x106 expect 0xc63e, result 0xc600
[   12.986687] CORE EH:
[   12.986687] set_port_vsr_data phy 5 reg 0x102 expect 0x74c5, result 0x74cf
[   13.026083] CORE EH:
[   13.026084] set_port_vsr_data phy 5 reg 0x106 expect 0xc63e, result 0xc600
[   13.045400] CORE EH:
[   13.045401] set_port_vsr_data phy 6 reg 0x102 expect 0x74c5, result 0x74cf
[   13.084798] CORE EH:
[   13.084798] set_port_vsr_data phy 6 reg 0x106 expect 0xc63e, result 0xc600
[   13.104112] CORE EH:
[   13.104113] set_port_vsr_data phy 7 reg 0x102 expect 0x74c6, result 0x74cf
[   13.143511] CORE EH:
[   13.143512] set_port_vsr_data phy 7 reg 0x106 expect 0xc63e, result 0xc600
[   13.559826] CORE EH:
[   13.559826] Get cable info error in connect 1
[   13.673546] CORE EH:
[   13.673547] Get cable info error in connect 2
[   16.122956] CORE EH:
[   16.122956] set_port_vsr_data phy 8 reg 0x102 expect 0x74c5, result 0x74cf
[   16.162354] CORE EH:
[   16.162354] set_port_vsr_data phy 8 reg 0x106 expect 0xc63e, result 0xc600
[   16.181670] CORE EH:
[   16.181671] set_port_vsr_data phy 9 reg 0x102 expect 0x74c5, result 0x74cf
[   16.221066] CORE EH:
[   16.221067] set_port_vsr_data phy 9 reg 0x106 expect 0xc63e, result 0xc600
[   16.240383] CORE EH:
[   16.240384] set_port_vsr_data phy a reg 0x102 expect 0x74c5, result 0x74cf
[   16.279781] CORE EH:
[   16.279781] set_port_vsr_data phy a reg 0x106 expect 0xc63e, result 0xc600
[   16.299097] CORE EH:
[   16.299098] set_port_vsr_data phy b reg 0x102 expect 0x74c5, result 0x74cf
[   16.338493] CORE EH:
[   16.338493] set_port_vsr_data phy b reg 0x106 expect 0xc63e, result 0xc600
[   16.357808] CORE EH:
[   16.357809] set_port_vsr_data phy c reg 0x102 expect 0x74c5, result 0x74cf
[   16.397207] CORE EH:
[   16.397208] set_port_vsr_data phy c reg 0x106 expect 0xc63e, result 0xc600
[   16.416522] CORE EH:
[   16.416522] set_port_vsr_data phy d reg 0x102 expect 0x74c5, result 0x74cf
[   16.455919] CORE EH:
[   16.455920] set_port_vsr_data phy d reg 0x106 expect 0xc63e, result 0xc600
[   16.475236] CORE EH:
[   16.475236] set_port_vsr_data phy e reg 0x102 expect 0x74c6, result 0x74cf
[   16.514632] CORE EH:
[   16.514632] set_port_vsr_data phy e reg 0x106 expect 0xc63e, result 0xc600
[   16.533944] CORE EH:
[   16.533944] set_port_vsr_data phy f reg 0x102 expect 0x74c5, result 0x74cf
[   16.573341] CORE EH:
[   16.573342] set_port_vsr_data phy f reg 0x106 expect 0xc63e, result 0xc600
[   16.982650] random: crng init done
[   16.989653] CORE EH:
[   16.989654] Get cable info error in connect 3
[   16.996360] CORE EH:
[   16.996361] root 1 queue 0 Attention entry 0
[   17.103372] CORE EH:
[   17.103373] Get cable info error in connect 4
[   19.270287] sched: RT throttling activated
[   19.270293] CORE EH:
[   19.270311] CORE EH:
[   19.270311] root 1 queue 0 Attention entry 1
[   19.283346] root 0 queue 0 Attention entry 0
[   19.287606] CORE EH:
[   19.287606] root 0 queue 0 Attention entry 1
[   19.294217] CORE EH:
[   19.294218] root 0 queue 0 Attention entry 2
[   19.610291] CORE EH:
[   19.610294] root 0 queue 0 Attention entry 15
[   21.263767] CORE EH:
[   21.263770] root 1 queue 0 Attention entry 10
[   21.302014] CORE EH:
[   21.302017] root 1 queue 0 Attention entry 16
[   21.310762] CORE:
[   21.310764] *  SGPIO 0 REG_CONFIG0 after initialization = 0x1e000007
[   21.319289] CORE:
[   21.319290] *  SGPIO 1 REG_CONFIG0 after initialization = 0xc000007
[   21.327721] CORE:
[   21.327721] *  SGPIO 2 REG_CONFIG0 after initialization = 0x1e000007
[   21.336241] CORE:
[   21.336241] *  SGPIO 3 REG_CONFIG0 after initialization = 0xc000007
[   21.344675] CORE:
[   21.344675] SGPIO0 count:0, interrupt:1
[   21.370595] CORE:
[   21.370595] SGPIO0 count:1, interrupt:1
[   21.376516] CORE:
[   21.376517] no sgpio data-in device connected
[   21.382955] CORE:
[   21.382955] SGPIO1 count:0, interrupt:1
[   21.398877] CORE:
[   21.398878] SGPIO1 count:1, interrupt:1
[   21.404795] CORE:
[   21.404796] no sgpio data-in device connected
[   21.411234] CORE:
[   21.411235] SGPIO2 count:0, interrupt:1
[   21.427156] CORE:
[   21.427156] SGPIO2 count:1, interrupt:1
[   21.433074] CORE:
[   21.433075] no sgpio data-in device connected
[   21.439515] CORE:
[   21.439515] SGPIO3 count:0, interrupt:1
[   21.455435] CORE:
[   21.455435] SGPIO3 count:1, interrupt:1
[   21.461356] CORE:
[   21.461356] no sgpio data-in device connected
[   21.467825] scsi host8: Marvell Storage Controller
[   21.472664] Start scsi_scan_host.
[   21.476014] Check proc_name[mv14xx].
[   21.479613] Check proc_name[mv14xx].
[   21.483902] Check proc_name[mv14xx].
[   21.487475] scsi 8:0:2:0: Direct-Access     ATA      ST9250610NS      SN03 PQ: 0 ANSI: 5
[   23.521622] Check proc_name[mv14xx].
[   23.525201] Check proc_name[mv14xx].
[   23.528768] Check proc_name[mv14xx].
[   23.532344] Check proc_name[mv14xx].
[   23.535925] Check proc_name[mv14xx].
[   23.539512] sd 8:0:2:0: Attached scsi generic sg9 type 0
[   23.545601] Check proc_name[mv14xx].
[   23.546698] sd 8:0:2:0: [sdj] 488397168 512-byte logical blocks: (250 GB/233 GiB)
[   23.546707] sd 8:0:2:0: [sdj] Write Protect is off
[   23.546734] sd 8:0:2:0: [sdj] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
[   23.546737] CORE EH:
[   23.546738] req ffff88086c5c9a00 [0xa3] status 0x7
[   23.577588] scsi 8:0:3:0: Direct-Access     ATA      ST9250610NS      SN03 PQ: 0 ANSI: 5
[   23.591651]  sdj: sdj1 sdj2 sdj3 sdj4 sdj5
[   23.599983] sd 8:0:2:0: [sdj] Attached SCSI disk
[   23.604596] Check proc_name[mv14xx].
[   25.569572] Check proc_name[mv14xx].
[   25.573145] Check proc_name[mv14xx].
[   25.576714] Check proc_name[mv14xx].
[   25.580290] Check proc_name[mv14xx].
[   25.583642] sd 8:0:3:0: [sdk] 488397168 512-byte logical blocks: (250 GB/233 GiB)
[   25.583654] sd 8:0:3:0: [sdk] Write Protect is off
[   25.583685] sd 8:0:3:0: [sdk] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
[   25.583689] CORE EH:
[   25.583689] req ffff88086c70a100 [0xa3] status 0x7
[   25.612277] Check proc_name[mv14xx].
[   25.615865] sd 8:0:3:0: Attached scsi generic sg10 type 0
[   25.622041] Check proc_name[mv14xx].
[   25.625614] scsi 8:0:4:0: Direct-Access     ATA      ST9250610NS      SN03 PQ: 0 ANSI: 5
[   25.637792]  sdk: sdk1 sdk2 sdk3 sdk4 sdk5
[   25.646139] sd 8:0:3:0: [sdk] Attached SCSI disk
[   25.650752] Check proc_name[mv14xx].
[   27.617627] Check proc_name[mv14xx].
[   27.621203] Check proc_name[mv14xx].
[   27.624773] Check proc_name[mv14xx].
[   27.628350] Check proc_name[mv14xx].
[   27.631928] Check proc_name[mv14xx].
[   27.635520] sd 8:0:4:0: Attached scsi generic sg11 type 0
[   27.641681] Check proc_name[mv14xx].
[   27.645249] scsi 8:0:5:0: Direct-Access     ATA      ST9250610NS      SN03 PQ: 0 ANSI: 5
[   27.653350] sd 8:0:4:0: [sdl] 488397168 512-byte logical blocks: (250 GB/233 GiB)
[   27.660828] sd 8:0:4:0: [sdl] Write Protect is off
[   27.665619] sd 8:0:4:0: [sdl] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
[   27.674647] CORE EH:
[   27.674647] req ffff88086c798100 [0xa3] status 0x7
[   27.737104]  sdl: sdl1 sdl2 sdl3 sdl4 sdl5
[   27.745936] sd 8:0:4:0: [sdl] Attached SCSI disk
[   27.750548] Check proc_name[mv14xx].
[   29.665608] Check proc_name[mv14xx].
[   29.669197] Check proc_name[mv14xx].
[   29.672765] Check proc_name[mv14xx].
[   29.676343] Check proc_name[mv14xx].
[   29.679923] Check proc_name[mv14xx].
[   29.683514] sd 8:0:5:0: Attached scsi generic sg12 type 0
[   29.689679] Check proc_name[mv14xx].
[   29.690756] sd 8:0:5:0: [sdm] 488397168 512-byte logical blocks: (250 GB/233 GiB)
[   29.690795] sd 8:0:5:0: [sdm] Write Protect is off
[   29.690833] sd 8:0:5:0: [sdm] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
[   29.690836] CORE EH:
[   29.690837] req ffff88086c798900 [0xa3] status 0x7
[   29.721657] scsi 8:0:6:0: Direct-Access     ATA      ST9250610NS      SN03 PQ: 0 ANSI: 5
[   29.738534]  sdm: sdm1 sdm2 sdm3 sdm4 sdm5
[   29.746877] sd 8:0:5:0: [sdm] Attached SCSI disk
[   29.751490] Check proc_name[mv14xx].
[   31.713444] Check proc_name[mv14xx].
[   31.717020] Check proc_name[mv14xx].
[   31.720587] Check proc_name[mv14xx].
[   31.724163] Check proc_name[mv14xx].
[   31.727748] Check proc_name[mv14xx].
[   31.731338] sd 8:0:6:0: Attached scsi generic sg13 type 0
[   31.737519] Check proc_name[mv14xx].
[   31.738534] sd 8:0:6:0: [sdn] 488397168 512-byte logical blocks: (250 GB/233 GiB)
[   31.738542] sd 8:0:6:0: [sdn] Write Protect is off
[   31.738567] sd 8:0:6:0: [sdn] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
[   31.738570] CORE EH:
[   31.738571] req ffff88086c5c9900 [0xa3] status 0x7
[   31.769503] scsi 8:0:7:0: Direct-Access     ATA      ST9250610NS      SN03 PQ: 0 ANSI: 5
[   31.791005]  sdn: sdn1 sdn2 sdn3 sdn4 sdn5
[   31.799365] sd 8:0:6:0: [sdn] Attached SCSI disk
[   31.803975] Check proc_name[mv14xx].
[   33.761579] Check proc_name[mv14xx].
[   33.765153] Check proc_name[mv14xx].
[   33.768719] Check proc_name[mv14xx].
[   33.772297] Check proc_name[mv14xx].
[   33.775638] sd 8:0:7:0: [sdo] 488397168 512-byte logical blocks: (250 GB/233 GiB)
[   33.775650] sd 8:0:7:0: [sdo] Write Protect is off
[   33.775680] sd 8:0:7:0: [sdo] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
[   33.775684] CORE EH:
[   33.775685] req ffff88086d1c7300 [0xa3] status 0x7
[   33.804283] Check proc_name[mv14xx].
[   33.807905] sd 8:0:7:0: Attached scsi generic sg14 type 0
[   33.813386] Check proc_name[mv14xx].
[   33.816987] Check proc_name[mv14xx].
[   33.821468] Check proc_name[mv14xx].
[   33.824555]  sdo: sdo1 sdo2 sdo3 sdo4 sdo5
[   33.828706] sd 8:0:7:0: [sdo] Attached SCSI disk
[   33.828707] Check proc_name[mv14xx].
[   33.837300] scsi 8:0:10:0: Direct-Access     ATA      WDC WD5003ABYZ-0 01.0 PQ: 0 ANSI: 5
[   35.810361] Check proc_name[mv14xx].
[   35.813937] Check proc_name[mv14xx].
[   35.817507] Check proc_name[mv14xx].
[   35.821087] Check proc_name[mv14xx].
[   35.824669] Check proc_name[mv14xx].
[   35.825638] sd 8:0:10:0: [sdp] 976773168 512-byte logical blocks: (500 GB/466 GiB)
[   35.825650] sd 8:0:10:0: [sdp] Write Protect is off
[   35.825675] sd 8:0:10:0: [sdp] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
[   35.825679] CORE EH:
[   35.825680] req ffff88087b57fd00 [0xa3] status 0x7
[   35.856915] sd 8:0:10:0: Attached scsi generic sg15 type 0
[   35.863317] Check proc_name[mv14xx].
[   35.866887] scsi 8:0:11:0: Direct-Access     ATA      WDC WD5003ABYZ-0 01.0 PQ: 0 ANSI: 5
[   35.882126]  sdp: sdp1 sdp2 sdp3 sdp4 sdp5
[   35.892745] sd 8:0:10:0: [sdp] Attached SCSI disk
[   35.897443] Check proc_name[mv14xx].
[   37.858331] Check proc_name[mv14xx].
[   37.861914] Check proc_name[mv14xx].
[   37.865485] Check proc_name[mv14xx].
[   37.869071] Check proc_name[mv14xx].
[   37.872659] Check proc_name[mv14xx].
[   37.873739] sd 8:0:11:0: [sdq] 976773168 512-byte logical blocks: (500 GB/466 GiB)
[   37.873760] sd 8:0:11:0: [sdq] Write Protect is off
[   37.873811] sd 8:0:11:0: [sdq] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
[   37.873817] CORE EH:
[   37.873818] req ffff880870af6600 [0xa3] status 0x7
[   37.904936] sd 8:0:11:0: Attached scsi generic sg16 type 0
[   37.911386] Check proc_name[mv14xx].
[   37.914960] scsi 8:0:12:0: Direct-Access     ATA      WDC WD5003ABYZ-0 01.0 PQ: 0 ANSI: 5
[   37.932973]  sdq: sdq1 sdq2 sdq3 sdq4 sdq5
[   37.943987] sd 8:0:11:0: [sdq] Attached SCSI disk
[   37.948686] Check proc_name[mv14xx].
[   39.906239] Check proc_name[mv14xx].
[   39.909818] Check proc_name[mv14xx].
[   39.913384] Check proc_name[mv14xx].
[   39.916963] Check proc_name[mv14xx].
[   39.920545] Check proc_name[mv14xx].
[   39.921588] sd 8:0:12:0: [sdr] 976773168 512-byte logical blocks: (500 GB/466 GiB)
[   39.921600] sd 8:0:12:0: [sdr] Write Protect is off
[   39.921640] sd 8:0:12:0: [sdr] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
[   39.921644] CORE EH:
[   39.921645] req ffff88086c70a000 [0xa3] status 0x7
[   39.952810] sd 8:0:12:0: Attached scsi generic sg17 type 0
[   39.959224] Check proc_name[mv14xx].
[   39.962798] scsi 8:0:13:0: Direct-Access     ATA      WDC WD5003ABYZ-0 01.0 PQ: 0 ANSI: 5
[   39.984404]  sdr: sdr1 sdr2 sdr3 sdr4 sdr5
[   39.995041] sd 8:0:12:0: [sdr] Attached SCSI disk
[   39.999740] Check proc_name[mv14xx].
[   41.954383] Check proc_name[mv14xx].
[   41.957968] Check proc_name[mv14xx].
[   41.961536] Check proc_name[mv14xx].
[   41.965117] Check proc_name[mv14xx].
[   41.968699] Check proc_name[mv14xx].
[   41.970152] sd 8:0:13:0: [sds] 976773168 512-byte logical blocks: (500 GB/466 GiB)
[   41.970165] sd 8:0:13:0: [sds] Write Protect is off
[   41.970197] sd 8:0:13:0: [sds] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
[   41.970201] CORE EH:
[   41.970201] req ffff88086c7ad300 [0xa3] status 0x7
[   42.000952] sd 8:0:13:0: Attached scsi generic sg18 type 0
[   42.006488] Check proc_name[mv14xx].
[   42.010087] Check proc_name[mv14xx].
[   42.013683] Check proc_name[mv14xx].
[   42.017273] Check proc_name[mv14xx].
[   42.020887] Check proc_name[mv14xx].
[   42.023472]  sds: sds1 sds2 sds3 sds4 sds5
[   42.028585] Check proc_name[mv14xx].
[   42.030143] sd 8:0:13:0: [sds] Attached SCSI disk
[   42.030143] Check proc_name[mv14xx].
[   42.040444] Check proc_name[mv14xx].
[   42.044055] Check proc_name[mv14xx].
[   42.047652] Check proc_name[mv14xx].
[   42.051259] Check proc_name[mv14xx].
[   42.054868] Check proc_name[mv14xx].
[   42.058473] Check proc_name[mv14xx].
[   42.062079] Check proc_name[mv14xx].
[   42.065696] Check proc_name[mv14xx].
[   42.069310] Check proc_name[mv14xx].
[   42.072899] Check proc_name[mv14xx].
[   42.076569] Check proc_name[mv14xx].
[   42.080193] Check proc_name[mv14xx].
[   42.083787] Check proc_name[mv14xx].
[   42.087382] Check proc_name[mv14xx].
[   42.091001] Check proc_name[mv14xx].
[   42.094595] Check proc_name[mv14xx].
[   42.098191] Check proc_name[mv14xx].
[   42.101781] Check proc_name[mv14xx].
[   42.105383] Check proc_name[mv14xx].
[   42.108980] Check proc_name[mv14xx].
[   42.112577] Check proc_name[mv14xx].
[   42.116172] Check proc_name[mv14xx].
[   42.119761] Check proc_name[mv14xx].
[   42.123354] Check proc_name[mv14xx].
[   42.126947] Check proc_name[mv14xx].
[   42.130617] Check proc_name[mv14xx].
[   42.134271] Check proc_name[mv14xx].
[   42.137873] Check proc_name[mv14xx].
[   42.141466] Check proc_name[mv14xx].
[   42.145078] Check proc_name[mv14xx].
[   42.148696] Check proc_name[mv14xx].
[   42.152315] Check proc_name[mv14xx].
[   42.155924] Check proc_name[mv14xx].
[   42.159542] Check proc_name[mv14xx].
[   42.163160] Check proc_name[mv14xx].
[   42.166756] Check proc_name[mv14xx].
[   42.170362] Check proc_name[mv14xx].
[   42.173957] Check proc_name[mv14xx].
[   42.177571] Check proc_name[mv14xx].
[   42.181187] Check proc_name[mv14xx].
[   42.184791] Check proc_name[mv14xx].
[   42.188406] Check proc_name[mv14xx].
[   42.191995] Check proc_name[mv14xx].
[   42.195606] Check proc_name[mv14xx].
[   42.199197] Check proc_name[mv14xx].
[   42.202818] Check proc_name[mv14xx].
[   42.206410] Check proc_name[mv14xx].
[   42.210025] Check proc_name[mv14xx].
[   42.213619] Check proc_name[mv14xx].
[   42.217228] Check proc_name[mv14xx].
[   42.220823] Check proc_name[mv14xx].
[   42.224438] Check proc_name[mv14xx].
[   42.228030] Check proc_name[mv14xx].
[   42.231654] Check proc_name[mv14xx].
[   42.235273] Check proc_name[mv14xx].
[   42.238864] Check proc_name[mv14xx].
[   42.242497] Check proc_name[mv14xx].
[   42.246113] Check proc_name[mv14xx].
[   42.249703] Check proc_name[mv14xx].
[   42.253325] Check proc_name[mv14xx].
[   42.256917] Check proc_name[mv14xx].
[   42.260507] Check proc_name[mv14xx].
[   42.264101] Check proc_name[mv14xx].
[   42.267715] Check proc_name[mv14xx].
[   42.271327] Check proc_name[mv14xx].
[   42.274943] Check proc_name[mv14xx].
[   42.278557] Check proc_name[mv14xx].
[   42.282170] Check proc_name[mv14xx].
[   42.285763] Check proc_name[mv14xx].
[   42.289378] Check proc_name[mv14xx].
[   42.292967] Check proc_name[mv14xx].
[   42.296555] Check proc_name[mv14xx].
[   42.300144] Check proc_name[mv14xx].
[   42.303736] Check proc_name[mv14xx].
[   42.307377] Check proc_name[mv14xx].
[   42.310968] Check proc_name[mv14xx].
[   42.314578] Check proc_name[mv14xx].
[   42.318171] Check proc_name[mv14xx].
[   42.321847] Check proc_name[mv14xx].
[   42.325450] Check proc_name[mv14xx].
[   42.329071] Check proc_name[mv14xx].
[   42.332686] Check proc_name[mv14xx].
[   42.336305] Check proc_name[mv14xx].
[   42.339897] Check proc_name[mv14xx].
[   42.343488] Check proc_name[mv14xx].
[   42.347123] Check proc_name[mv14xx].
[   42.350715] Check proc_name[mv14xx].
[   42.354351] Check proc_name[mv14xx].
[   42.357942] Check proc_name[mv14xx].
[   42.361578] Check proc_name[mv14xx].
[   42.365194] Check proc_name[mv14xx].
[   42.368786] Check proc_name[mv14xx].
[   42.372378] Check proc_name[mv14xx].
[   42.375990] Check proc_name[mv14xx].
[   42.379607] Check proc_name[mv14xx].
[   42.383226] Check proc_name[mv14xx].
[   42.386816] Check proc_name[mv14xx].
[   42.390435] Check proc_name[mv14xx].
[   42.394026] Check proc_name[mv14xx].
[   42.397638] Check proc_name[mv14xx].
[   42.401244] Check proc_name[mv14xx].
[   42.404836] Check proc_name[mv14xx].
[   42.408442] Check proc_name[mv14xx].
[   42.412055] Check proc_name[mv14xx].
[   42.415661] Check proc_name[mv14xx].
[   42.419277] Check proc_name[mv14xx].
[   42.422868] Check proc_name[mv14xx].
[   42.426482] Check proc_name[mv14xx].
[   42.430092] Check proc_name[mv14xx].
[   42.433684] Check proc_name[mv14xx].
[   42.437289] Check proc_name[mv14xx].
[   42.440881] Check proc_name[mv14xx].
[   42.444470] Check proc_name[mv14xx].
[   42.448112] Check proc_name[mv14xx].
[   42.451704] Check proc_name[mv14xx].
[   42.455340] Check proc_name[mv14xx].
[   42.458931] Check proc_name[mv14xx].
[   42.462547] Check proc_name[mv14xx].
[   42.466162] Check proc_name[mv14xx].
[   42.469754] Check proc_name[mv14xx].
[   42.473345] Check proc_name[mv14xx].
[   42.476957] Check proc_name[mv14xx].
[   42.480546] Check proc_name[mv14xx].
[   42.484187] Check proc_name[mv14xx].
[   42.487782] Check proc_name[mv14xx].
[   42.491373] Check proc_name[mv14xx].
[   42.494968] Check proc_name[mv14xx].
[   42.498557] Check proc_name[mv14xx].
[   42.502192] Check proc_name[mv14xx].
[   42.505786] Check proc_name[mv14xx].
[   42.509379] Check proc_name[mv14xx].
[   42.512992] Check proc_name[mv14xx].
[   42.516585] Check proc_name[mv14xx].
[   42.520220] Check proc_name[mv14xx].
[   42.523813] Check proc_name[mv14xx].
[   42.527405] Check proc_name[mv14xx].
[   42.531003] Check proc_name[mv14xx].
[   42.534591] Check proc_name[mv14xx].
[   42.538180] Check proc_name[mv14xx].
[   42.541785] Check proc_name[mv14xx].
[   42.545394] Check proc_name[mv14xx].
[   42.548984] Check proc_name[mv14xx].
[   42.552578] Check proc_name[mv14xx].
[   42.556240] Check proc_name[mv14xx].
[   42.559851] Check proc_name[mv14xx].
[   42.563466] Check proc_name[mv14xx].
[   42.567088] Check proc_name[mv14xx].
[   42.570695] Check proc_name[mv14xx].
[   42.574304] Check proc_name[mv14xx].
[   42.577901] Check proc_name[mv14xx].
[   42.581493] Check proc_name[mv14xx].
[   42.585129] Check proc_name[mv14xx].
[   42.588722] Check proc_name[mv14xx].
[   42.592355] Check proc_name[mv14xx].
[   42.595944] Check proc_name[mv14xx].
[   42.599581] Check proc_name[mv14xx].
[   42.603198] Check proc_name[mv14xx].
[   42.606792] Check proc_name[mv14xx].
[   42.610385] Check proc_name[mv14xx].
[   42.613997] Check proc_name[mv14xx].
[   42.617590] Check proc_name[mv14xx].
[   42.621209] Check proc_name[mv14xx].
[   42.624803] Check proc_name[mv14xx].
[   42.628417] Check proc_name[mv14xx].
[   42.632011] Check proc_name[mv14xx].
[   42.635601] Check proc_name[mv14xx].
[   42.639191] Check proc_name[mv14xx].
[   42.642802] Check proc_name[mv14xx].
[   42.646419] Check proc_name[mv14xx].
[   42.650012] Check proc_name[mv14xx].
[   42.653604] Check proc_name[mv14xx].
[   42.657192] Check proc_name[mv14xx].
[   42.660810] Check proc_name[mv14xx].
[   42.664400] Check proc_name[mv14xx].
[   42.667993] Check proc_name[mv14xx].
[   42.671664] Check proc_name[mv14xx].
[   42.675284] Check proc_name[mv14xx].
[   42.678901] Check proc_name[mv14xx].
[   42.682495] Check proc_name[mv14xx].
[   42.686091] Check proc_name[mv14xx].
[   42.689682] Check proc_name[mv14xx].
[   42.693307] Check proc_name[mv14xx].
[   42.696900] Check proc_name[mv14xx].
[   42.700513] Check proc_name[mv14xx].
[   42.704129] Check proc_name[mv14xx].
[   42.707720] Check proc_name[mv14xx].
[   42.711357] Check proc_name[mv14xx].
[   42.714950] Check proc_name[mv14xx].
[   42.718543] Check proc_name[mv14xx].
[   42.722137] Check proc_name[mv14xx].
[   42.725726] Check proc_name[mv14xx].
[   42.729317] Check proc_name[mv14xx].
[   42.732910] Check proc_name[mv14xx].
[   42.736499] Check proc_name[mv14xx].
[   42.740097] Check proc_name[mv14xx].
[   42.743687] Check proc_name[mv14xx].
[   42.747278] Check proc_name[mv14xx].
[   42.750870] Check proc_name[mv14xx].
[   42.754542] Check proc_name[mv14xx].
[   42.758199] Check proc_name[mv14xx].
[   42.761799] Check proc_name[mv14xx].
[   42.765394] Check proc_name[mv14xx].
[   42.768984] Check proc_name[mv14xx].
[   42.772574] Check proc_name[mv14xx].
[   42.776230] Check proc_name[mv14xx].
[   42.779829] Check proc_name[mv14xx].
[   42.783447] Check proc_name[mv14xx].
[   42.787041] Check proc_name[mv14xx].
[   42.790738] Check proc_name[mv14xx].
[   42.794340] Check proc_name[mv14xx].
[   42.797959] Check proc_name[mv14xx].
[   42.801551] Check proc_name[mv14xx].
[   42.805143] Check proc_name[mv14xx].
[   42.808736] Check proc_name[mv14xx].
[   42.812358] Check proc_name[mv14xx].
[   42.815949] Check proc_name[mv14xx].
[   42.819543] Check proc_name[mv14xx].
[   42.823238] Check proc_name[mv14xx].
[   42.826837] Check proc_name[mv14xx].
[   42.830455] Check proc_name[mv14xx].
[   42.834045] Check proc_name[mv14xx].
[   42.837654] Check proc_name[mv14xx].
[   42.841291] Check proc_name[mv14xx].
[   42.844900] Check proc_name[mv14xx].
[   42.848518] Check proc_name[mv14xx].
[   42.852135] Check proc_name[mv14xx].
[   42.855727] Check proc_name[mv14xx].
[   42.859316] Check proc_name[mv14xx].
[   42.862930] Check proc_name[mv14xx].
[   42.866523] Check proc_name[mv14xx].
[   42.870162] Check proc_name[mv14xx].
[   42.873752] Check proc_name[mv14xx].
[   42.877345] Check proc_name[mv14xx].
[   42.880938] Check proc_name[mv14xx].
[   42.884528] Check proc_name[mv14xx].
[   42.888170] Check proc_name[mv14xx].
[   42.891741] scsi 8:0:255:0: RAID              MARVELL  Virtual Device   1.00 PQ: 0 ANSI: 4
[   43.999322] Check proc_name[mv14xx].
[   44.002921] scsi 8:0:255:0: Attached scsi generic sg19 type 12
[   44.008796] Check proc_name[mv14xx].
[   44.294789] e1000e: Intel(R) PRO/1000 Network Driver - 3.2.6-k
[   44.300616] e1000e: Copyright(c) 1999 - 2015 Intel Corporation.
[   44.308226] igb: Intel(R) Gigabit Ethernet Network Driver - version 5.4.0-k
[   44.315180] igb: Copyright (c) 2007-2014 Intel Corporation.
[   44.551756] pps pps0: new PPS source ptp0
[   44.555762] igb 0000:03:00.0: added PHC on eth0
[   44.560284] igb 0000:03:00.0: Intel(R) Gigabit Ethernet Network Connection
[   44.567146] igb 0000:03:00.0: eth0: (PCIe:2.5Gb/s:Width x1) 00:18:7d:ff:2c:d9
[   44.574306] igb 0000:03:00.0: eth0: PBA No: 000300-000
[   44.579436] igb 0000:03:00.0: Using MSI-X interrupts. 4 rx queue(s), 4 tx queue(s)
[   45.097749] device-mapper: tier-algo: dm_tier_algo_register: algorithm hro registration success
[   45.107632] flashcache: flashcache-3.1.1-7.6 initialized
[   45.117027] drbd: initialized. Version: 8.4.10 (api:1/proto:86-101)
[   45.123283] drbd: srcversion: 26515B105F009E4AA2A7242
[   45.128412] drbd: registered as block device major 147
[   45.134724] i2c_imc: using this driver is dangerous unless your firmware is specifically designed for it; use at your own risk
[   49.237039] FAT-fs (sdi1): bogus number of reserved sectors
[   49.242605] FAT-fs (sdi1): Can't find a valid FAT filesystem
[   55.735114] usbcore: registered new interface driver usbserial
[   55.741609] usbcore: registered new interface driver pl2303
[   55.747179] usbserial: USB Serial support registered for pl2303
[   55.753707] jnl: driver (UFSD_HEAD lke_9.5.8_b6) loaded at ffffffffa03e7000
[   55.762139] ufsd: driver (UFSD_HEAD lke_9.5.8_b6, acl, ioctl, sd2(5), tr, car) loaded at ffffffffa03f5000
[   55.762139] NTFSJ support included
[   55.762139] exFAT support included
[   55.762139] Hfs+J support included
[   55.762139] Build_for__QNAP_Autobuild_2018-04-11_lke_9.5.8_b6
[   55.787551] ufsd: PAGE_SIZE=4K, THREAD_SIZE=16k
[   55.792073] ufsd: Kernel .config hash: original 0x59edfa66, current can't check.
[   55.799453] ufsd: Kernel .config hash: original 0x59edfa66, current can't check
[   55.840617] udevd (2792): /proc/2792/oom_adj is deprecated, please use /proc/2792/oom_score_adj instead.
[   55.850092] udev: starting version 140
[   55.978331] EXT4-fs (sdf1): mounting ext3 file system using the ext4 subsystem
[   56.004622] ext4_init_reserve_inode_table0: sdf1, 5
[   56.009497] ext4_init_reserve_inode_table2: sdf1, 5, 0, 0, 4096
[   56.015419] EXT4-fs (sdf1): mounted filesystem with ordered data mode. Opts: data=ordered
[   58.485187] EXT4-fs (sdf1): mounting ext3 file system using the ext4 subsystem
[   58.512901] ext4_init_reserve_inode_table0: sdf1, 5
[   58.517778] ext4_init_reserve_inode_table2: sdf1, 5, 0, 0, 4096
[   58.523705] EXT4-fs (sdf1): mounted filesystem with ordered data mode. Opts: (null)
[   63.539927] CORE EH:
[   63.539930] error info 0x0000000001000000.
[   63.546376] CORE EH:
[   63.546377] dev 7, req ffffc900007a7374.
[   63.552645] CORE EH:
[   63.552646] device 7 task file error, D2H[0]=0x4514034.
[   63.655580] EXT4-fs (sdo1): mounting ext3 file system using the ext4 subsystem
[   63.673121] ext4_init_reserve_inode_table0: sdo1, 5
[   63.678000] ext4_init_reserve_inode_table2: sdo1, 5, 0, 0, 4096
[   63.683946] EXT4-fs (sdo1): mounted filesystem with ordered data mode. Opts: (null)
[   66.230284] CORE EH:
[   66.230286] error info 0x0000000001000000.
[   66.236731] CORE EH:
[   66.236732] dev 7, req ffffc900007a7374.
[   66.243001] CORE EH:
[   66.243002] device 7 task file error, D2H[0]=0x4514034.
[   68.827281] EXT4-fs (sdd1): mounting ext3 file system using the ext4 subsystem
[   68.852757] ext4_init_reserve_inode_table0: sdd1, 5
[   68.857632] ext4_init_reserve_inode_table2: sdd1, 5, 0, 0, 4096
[   68.863558] EXT4-fs (sdd1): mounted filesystem with ordered data mode. Opts: (null)
[   73.822084] CORE EH:
[   73.822087] error info 0x0000000001000000.
[   73.828528] CORE EH:
[   73.828530] dev 5, req ffffc900007a7374.
[   73.834797] CORE EH:
[   73.834797] device 5 task file error, D2H[0]=0x4514034.
[   73.921451] EXT4-fs (sdm1): mounting ext3 file system using the ext4 subsystem
[   73.938925] ext4_init_reserve_inode_table0: sdm1, 5
[   73.943808] ext4_init_reserve_inode_table2: sdm1, 5, 0, 0, 4096
[   73.949744] EXT4-fs (sdm1): mounted filesystem with ordered data mode. Opts: (null)
[   76.454471] CORE EH:
[   76.454474] error info 0x0000000001000000.
[   76.460918] CORE EH:
[   76.460919] dev 5, req ffffc900007a7374.
[   76.467188] CORE EH:
[   76.467189] device 5 task file error, D2H[0]=0x4514034.
[   79.047907] EXT4-fs (sdb1): mounting ext3 file system using the ext4 subsystem
[   79.074374] ext4_init_reserve_inode_table0: sdb1, 5
[   79.079253] ext4_init_reserve_inode_table2: sdb1, 5, 0, 0, 4096
[   79.085180] EXT4-fs (sdb1): mounted filesystem with ordered data mode. Opts: (null)
[   84.036111] CORE EH:
[   84.036114] error info 0x0000000001000000.
[   84.042560] CORE EH:
[   84.042562] dev 3, req ffffc900007a7374.
[   84.048831] CORE EH:
[   84.048832] device 3 task file error, D2H[0]=0x4514034.
[   84.151879] EXT4-fs (sdk1): mounting ext3 file system using the ext4 subsystem
[   84.177745] ext4_init_reserve_inode_table0: sdk1, 5
[   84.182624] ext4_init_reserve_inode_table2: sdk1, 5, 0, 0, 4096
[   84.188551] EXT4-fs (sdk1): mounted filesystem with ordered data mode. Opts: (null)
[   86.693417] CORE EH:
[   86.693420] error info 0x0000000001000000.
[   86.699862] CORE EH:
[   86.699863] dev 3, req ffffc900007a7374.
[   86.706130] CORE EH:
[   86.706131] device 3 task file error, D2H[0]=0x4514034.
[   89.310523] CORE EH:
[   89.310526] error info 0x0000000001000000.
[   89.316970] CORE EH:
[   89.316971] dev 13, req ffffc900007a7374.
[   89.323323] CORE EH:
[   89.323324] device 13 task file error, D2H[0]=0x4514034.
[   89.478380] EXT4-fs (sds1): mounting ext3 file system using the ext4 subsystem
[   89.511268] ext4_init_reserve_inode_table0: sds1, 5
[   89.516144] ext4_init_reserve_inode_table2: sds1, 5, 0, 0, 4096
[   89.522070] EXT4-fs (sds1): mounted filesystem with ordered data mode. Opts: (null)
[   92.018558] CORE EH:
[   92.018561] error info 0x0000000001000000.
[   92.025006] CORE EH:
[   92.025007] dev 13, req ffffc900007a7374.
[   92.031363] CORE EH:
[   92.031364] device 13 task file error, D2H[0]=0x4514034.
[   94.683209] CORE EH:
[   94.683212] error info 0x0000000001000000.
[   94.689660] CORE EH:
[   94.689661] dev 11, req ffffc900007a7374.
[   94.696017] CORE EH:
[   94.696018] device 11 task file error, D2H[0]=0x4514034.
[   94.849502] EXT4-fs (sdq1): mounting ext3 file system using the ext4 subsystem
[   94.883772] ext4_init_reserve_inode_table0: sdq1, 5
[   94.888650] ext4_init_reserve_inode_table2: sdq1, 5, 0, 0, 4096
[   94.894575] EXT4-fs (sdq1): mounted filesystem with ordered data mode. Opts: (null)
[   97.392358] CORE EH:
[   97.392361] error info 0x0000000001000000.
[   97.398807] CORE EH:
[   97.398808] dev 11, req ffffc900007a7374.
[   97.405159] CORE EH:
[   97.405161] device 11 task file error, D2H[0]=0x4514034.
[  100.022771] EXT4-fs (sdg1): mounting ext3 file system using the ext4 subsystem
[  100.048285] ext4_init_reserve_inode_table0: sdg1, 5
[  100.053175] ext4_init_reserve_inode_table2: sdg1, 5, 0, 0, 4096
[  100.059102] EXT4-fs (sdg1): mounted filesystem with ordered data mode. Opts: (null)
[  104.843513] EXT4-fs (nvme1n1p1): mounting ext3 file system using the ext4 subsystem
[  104.851560] ext4_init_reserve_inode_table0: nvme1n1p1, 5
[  104.856871] ext4_init_reserve_inode_table2: nvme1n1p1, 5, 0, 0, 4096
[  104.863231] EXT4-fs (nvme1n1p1): mounted filesystem with ordered data mode. Opts: (null)
[  109.636834] EXT4-fs (sde1): mounting ext3 file system using the ext4 subsystem
[  109.662274] ext4_init_reserve_inode_table0: sde1, 5
[  109.667153] ext4_init_reserve_inode_table2: sde1, 5, 0, 0, 4096
[  109.673078] EXT4-fs (sde1): mounted filesystem with ordered data mode. Opts: (null)
[  114.677440] CORE EH:
[  114.677443] error info 0x0000000001000000.
[  114.683889] CORE EH:
[  114.683890] dev 6, req ffffc900007a7374.
[  114.690157] CORE EH:
[  114.690158] device 6 task file error, D2H[0]=0x4514034.
[  114.801920] EXT4-fs (sdn1): mounting ext3 file system using the ext4 subsystem
[  114.819256] ext4_init_reserve_inode_table0: sdn1, 5
[  114.824126] ext4_init_reserve_inode_table2: sdn1, 5, 0, 0, 4096
[  114.830048] EXT4-fs (sdn1): mounted filesystem with ordered data mode. Opts: (null)
[  117.376244] CORE EH:
[  117.376247] error info 0x0000000001000000.
[  117.382694] CORE EH:
[  117.382695] dev 6, req ffffc900007a7374.
[  117.388961] CORE EH:
[  117.388962] device 6 task file error, D2H[0]=0x4514034.
[  119.975113] EXT4-fs (sdc1): mounting ext3 file system using the ext4 subsystem
[  120.001499] ext4_init_reserve_inode_table0: sdc1, 5
[  120.006376] ext4_init_reserve_inode_table2: sdc1, 5, 0, 0, 4096
[  120.012304] EXT4-fs (sdc1): mounted filesystem with ordered data mode. Opts: (null)
[  124.979182] CORE EH:
[  124.979183] error info 0x0000000001000000.
[  124.985625] CORE EH:
[  124.985626] dev 4, req ffffc900007a7374.
[  124.991894] CORE EH:
[  124.991894] device 4 task file error, D2H[0]=0x4514034.
[  125.078431] EXT4-fs (sdl1): mounting ext3 file system using the ext4 subsystem
[  125.095972] ext4_init_reserve_inode_table0: sdl1, 5
[  125.100850] ext4_init_reserve_inode_table2: sdl1, 5, 0, 0, 4096
[  125.106779] EXT4-fs (sdl1): mounted filesystem with ordered data mode. Opts: (null)
[  127.611257] CORE EH:
[  127.611260] error info 0x0000000001000000.
[  127.617709] CORE EH:
[  127.617710] dev 4, req ffffc900007a7374.
[  127.623979] CORE EH:
[  127.623980] device 4 task file error, D2H[0]=0x4514034.
[  130.198088] EXT4-fs (sda1): mounting ext3 file system using the ext4 subsystem
[  130.223464] ext4_init_reserve_inode_table0: sda1, 5
[  130.228341] ext4_init_reserve_inode_table2: sda1, 5, 0, 0, 4096
[  130.234270] EXT4-fs (sda1): mounted filesystem with ordered data mode. Opts: (null)
[  135.197899] CORE EH:
[  135.197902] error info 0x0000000001000000.
[  135.204348] CORE EH:
[  135.204349] dev 2, req ffffc900007a7374.
[  135.210616] CORE EH:
[  135.210617] device 2 task file error, D2H[0]=0x4514034.
[  135.296816] EXT4-fs (sdj1): mounting ext3 file system using the ext4 subsystem
[  135.314428] ext4_init_reserve_inode_table0: sdj1, 5
[  135.319305] ext4_init_reserve_inode_table2: sdj1, 5, 0, 0, 4096
[  135.325233] EXT4-fs (sdj1): mounted filesystem with ordered data mode. Opts: (null)
[  137.829506] CORE EH:
[  137.829509] error info 0x0000000001000000.
[  137.835953] CORE EH:
[  137.835954] dev 2, req ffffc900007a7374.
[  137.842221] CORE EH:
[  137.842221] device 2 task file error, D2H[0]=0x4514034.
[  140.448261] CORE EH:
[  140.448264] error info 0x0000000001000000.
[  140.454713] CORE EH:
[  140.454714] dev 12, req ffffc900007a7374.
[  140.461070] CORE EH:
[  140.461071] device 12 task file error, D2H[0]=0x4514034.
[  140.614729] EXT4-fs (sdr1): mounting ext3 file system using the ext4 subsystem
[  140.648519] ext4_init_reserve_inode_table0: sdr1, 5
[  140.653396] ext4_init_reserve_inode_table2: sdr1, 5, 0, 0, 4096
[  140.659323] EXT4-fs (sdr1): mounted filesystem with ordered data mode. Opts: (null)
[  143.157190] CORE EH:
[  143.157192] error info 0x0000000001000000.
[  143.163635] CORE EH:
[  143.163636] dev 12, req ffffc900007a7374.
[  143.169989] CORE EH:
[  143.169990] device 12 task file error, D2H[0]=0x4514034.
[  145.617047] EXT4-fs (nvme0n1p1): mounting ext3 file system using the ext4 subsystem
[  145.625109] ext4_init_reserve_inode_table0: nvme0n1p1, 5
[  145.630415] ext4_init_reserve_inode_table2: nvme0n1p1, 5, 0, 0, 4096
[  145.636773] EXT4-fs (nvme0n1p1): mounted filesystem with ordered data mode. Opts: (null)
[  150.401648] EXT4-fs (sdh1): mounting ext3 file system using the ext4 subsystem
[  150.428081] ext4_init_reserve_inode_table0: sdh1, 5
[  150.432960] ext4_init_reserve_inode_table2: sdh1, 5, 0, 0, 4096
[  150.438885] EXT4-fs (sdh1): mounted filesystem with ordered data mode. Opts: (null)
[  155.383141] CORE EH:
[  155.383145] error info 0x0000000001000000.
[  155.389594] CORE EH:
[  155.389595] dev 10, req ffffc900007a7374.
[  155.395948] CORE EH:
[  155.395949] device 10 task file error, D2H[0]=0x4514034.
[  155.550299] EXT4-fs (sdp1): mounting ext3 file system using the ext4 subsystem
[  155.583571] ext4_init_reserve_inode_table0: sdp1, 5
[  155.588447] ext4_init_reserve_inode_table2: sdp1, 5, 0, 0, 4096
[  155.594370] EXT4-fs (sdp1): mounted filesystem with ordered data mode. Opts: (null)
[  158.083919] CORE EH:
[  158.083922] error info 0x0000000001000000.
[  158.090372] CORE EH:
[  158.090374] dev 10, req ffffc900007a7374.
[  158.096729] CORE EH:
[  158.096729] device 10 task file error, D2H[0]=0x4514034.
[  158.915299] md: md9 stopped.
[  158.937077] md/raid1:md9: active with 20 out of 32 mirrors
[  158.988798] md9: detected capacity change from 0 to 542769152
[  160.142586] EXT4-fs (md9): mounting ext3 file system using the ext4 subsystem
[  160.178590] ext4_init_reserve_inode_table0: md9, 5
[  160.183386] ext4_init_reserve_inode_table2: md9, 5, 0, 0, 4096
[  160.189223] EXT4-fs (md9): mounted filesystem with ordered data mode. Opts: data=ordered
[  160.744365] md: md13 stopped.
[  160.766593] md/raid1:md13: active with 20 out of 32 mirrors
[  160.799092] md13: detected capacity change from 0 to 469893120
[  169.186682] CORE EH:
[  169.186685] error info 0x0000000001000000.
[  169.193135] CORE EH:
[  169.193136] dev 3, req ffffc900007a71e8.
[  169.199404] CORE EH:
[  169.199405] device 3 task file error, D2H[0]=0x4514034.
[  169.254722] CORE EH:
[  169.254725] req ffff88086f670a00 [0x12] status 0x7
[  169.268544] CORE EH:
[  169.268547] req ffff88087bcdeb00 [0x12] status 0x7
[  171.764812] CORE EH:
[  171.764815] error info 0x0000000001000000.
[  171.771262] CORE EH:
[  171.771263] dev 5, req ffffc900007a71e8.
[  171.777533] CORE EH:
[  171.777534] device 5 task file error, D2H[0]=0x4514034.
[  171.943217] CORE EH:
[  171.943221] req ffff88086c698f00 [0x12] status 0x7
[  171.957688] CORE EH:
[  171.957691] req ffff88086c691000 [0x12] status 0x7
[  174.494759] CORE EH:
[  174.494762] error info 0x0000000001000000.
[  174.501207] CORE EH:
[  174.501208] dev 7, req ffffc900007a79a4.
[  174.507472] CORE EH:
[  174.507473] device 7 task file error, D2H[0]=0x4514034.
[  174.571744] CORE EH:
[  174.571748] req ffff880870e1a700 [0x12] status 0x7
[  174.585301] CORE EH:
[  174.585304] req ffff880872c17500 [0x12] status 0x7
[  177.077694] CORE EH:
[  177.077697] error info 0x0000000001000000.
[  177.084155] CORE EH:
[  177.084156] dev 2, req ffffc900007a79a4.
[  177.090425] CORE EH:
[  177.090426] device 2 task file error, D2H[0]=0x4514034.
[  177.247771] CORE EH:
[  177.247775] req ffff88087511e300 [0x12] status 0x7
[  177.266775] CORE EH:
[  177.266778] req ffff880879063900 [0x12] status 0x7
[  179.760348] CORE EH:
[  179.760351] error info 0x0000000001000000.
[  179.766800] CORE EH:
[  179.766801] dev 4, req ffffc900007a7b30.
[  179.773071] CORE EH:
[  179.773072] device 4 task file error, D2H[0]=0x4514034.
[  179.829902] CORE EH:
[  179.829905] req ffff8808753e5700 [0x12] status 0x7
[  179.843749] CORE EH:
[  179.843752] req ffff880870686700 [0x12] status 0x7
[  182.369600] CORE EH:
[  182.369601] error info 0x0000000001000000.
[  182.376061] CORE EH:
[  182.376063] dev 6, req ffffc900007a7b30.
[  182.382330] CORE EH:
[  182.382330] device 6 task file error, D2H[0]=0x4514034.
[  182.538841] CORE EH:
[  182.538844] req ffff8808705b2e00 [0x12] status 0x7
[  182.552778] CORE EH:
[  182.552781] req ffff880874ceb200 [0x12] status 0x7
[  204.398886] CORE EH:
[  204.398889] error info 0x0000000001000000.
[  204.405337] CORE EH:
[  204.405339] dev 10, req ffffc900007a71e8.
[  204.411691] CORE EH:
[  204.411692] device 10 task file error, D2H[0]=0x4514034.
[  207.006849] CORE EH:
[  207.006852] error info 0x0000000001000000.
[  207.013297] CORE EH:
[  207.013298] dev 11, req ffffc900007a71e8.
[  207.019652] CORE EH:
[  207.019653] device 11 task file error, D2H[0]=0x4514034.
[  209.613587] CORE EH:
[  209.613588] error info 0x0000000001000000.
[  209.620038] CORE EH:
[  209.620039] dev 12, req ffffc900007a71e8.
[  209.626394] CORE EH:
[  209.626394] device 12 task file error, D2H[0]=0x4514034.
[  212.301210] CORE EH:
[  212.301213] error info 0x0000000001000000.
[  212.307674] CORE EH:
[  212.307675] dev 13, req ffffc900007a7b30.
[  212.314031] CORE EH:
[  212.314032] device 13 task file error, D2H[0]=0x4514034.
[  213.777848] md/raid1:md321: active with 1 out of 2 mirrors
[  213.784633] md321: detected capacity change from 0 to 8482521088
[  213.812400] md: recovery of RAID array md321
[  213.816666] md: Recovering started: md321
[  213.816667] md/raid:md321: report qnap hal event: type = HAL_EVENT_RAID, action = REBUILDING_START
[  213.816669] md/raid:md321: report qnap hal event: raid_id=321, pd_name=/dev/(null), spare=/dev/(null), pd_repair_sector=0
[  213.857019] Adding 8283708k swap on /dev/md321.  Priority:-2 extents:1 across:8283708k FS
[  215.640721] NET: Registered protocol family 10
[  215.645330] Segment Routing with IPv6
[  216.415588] md/raid1:md256: active with 2 out of 2 mirrors
[  216.429101] md256: detected capacity change from 0 to 542834688
[  216.489351] Adding 530108k swap on /dev/md256.  Priority:-3 extents:1 across:530108k FS
[  217.939488] md/raid1:md322: active with 2 out of 2 mirrors
[  217.953616] md322: detected capacity change from 0 to 7408779264
[  218.041433] Adding 7235132k swap on /dev/md322.  Priority:-4 extents:1 across:7235132k FS
[  218.152465] md: md2 stopped.
[  218.173613] md2: detected capacity change from 0 to 1980020817920
[  219.836687] flashcache: ssd_devname /dev/mapper/vg256-lv256 ssd_vdevname 253:2 cache_devname /dev/mapper/vg256-lv256
[  219.848753] device-mapper: flashcache: Slow (clean) Shutdown Detected
[  219.855184] Only CLEAN blocks exist in cache
[  219.855185] device-mapper: flashcache: flashcache_writeback_load: md_blocks = 210186, md_sectors = 1681488, md_block_size = 8
[  219.855185]
[  219.872204] cache_sb_state facecafe last_slot_id 2 block_size 2048 md_block_size 8 size 1681408 assoc 512 disk_assoc 512 cache_devsize 3445694464 cache_version 5 cached_disk_count 1 cache_devname                                       
[  219.889855] flashcache: load 1 slot
[  219.893343] flashcache: slot id 2 uuid LVM-mi9NpJU59yrt6C8eKTzxUVjKvoPPMirbVTcYCG4QKDTz8BksFnEeMRqFQjmFxbiz
[  219.903069] device-mapper: flashcache: Allocate 45976KB (28B per) mem for 1681408-entry cache(capacity:1682229MB, associativity:512, block size:2048 sectors(1024KB))
[  219.920487] device-mapper: flashcache: Allocate 630528KB (8B per) mem for bitmap of 1681408-entry cache, one entry needs 48 u64 bitmap
[  220.681288] device-mapper: flashcache: flashcache_writeback_load: Cache metadata loaded from disk with 199 valid 0 DIRTY blocks
[  220.707457] device-mapper: flashcache: Cache metadata saved to disk
[  220.727450] flashcache do_switch 1
[  221.194411] device-mapper: flashcache: Cache metadata saved to disk
[  221.200671] device-mapper: flashcache: flashcache_writeback_md_store: valid blocks = 199 dirty blocks = 0 md_sectors = 1681488
[  221.200671]
[  221.501913] md: md1 stopped.
[  221.538069] md/raid:md1: device sdk3 operational as raid disk 0
[  221.543979] md/raid:md1: device sds3 operational as raid disk 17
[  221.549974] md/raid:md1: device sdr3 operational as raid disk 16
[  221.555970] md/raid:md1: device sdq3 operational as raid disk 15
[  221.561965] md/raid:md1: device sdp3 operational as raid disk 14
[  221.567957] md/raid:md1: device sdh3 operational as raid disk 13
[  221.573950] md/raid:md1: device sdg3 operational as raid disk 12
[  221.579944] md/raid:md1: device sdf3 operational as raid disk 11
[  221.585938] md/raid:md1: device sde3 operational as raid disk 10
[  221.591935] md/raid:md1: device sdd3 operational as raid disk 9
[  221.597841] md/raid:md1: device sdc3 operational as raid disk 8
[  221.603747] md/raid:md1: device sdb3 operational as raid disk 7
[  221.609653] md/raid:md1: device sda3 operational as raid disk 6
[  221.615558] md/raid:md1: device sdn3 operational as raid disk 5
[  221.621466] md/raid:md1: device sdl3 operational as raid disk 4
[  221.627371] md/raid:md1: device sdj3 operational as raid disk 3
[  221.633280] md/raid:md1: device sdo3 operational as raid disk 2
[  221.639190] md/raid:md1: device sdm3 operational as raid disk 1
[  221.652511] md/raid:md1: raid level 6 active with 18 out of 18 devices, algorithm 2
[  221.660165] md/raid:md1: /dev/sdk3 does not support SSD Trim.
[  221.665901] md/raid:md1: /dev/sds3 does not support SSD Trim.
[  221.671635] md/raid:md1: /dev/sdr3 does not support SSD Trim.
[  221.677372] md/raid:md1: /dev/sdq3 does not support SSD Trim.
[  221.683110] md/raid:md1: /dev/sdp3 does not support SSD Trim.
[  221.688847] md/raid:md1: /dev/sdh3 does not support SSD Trim.
[  221.694578] md/raid:md1: /dev/sdg3 does not support SSD Trim.
[  221.700313] md/raid:md1: /dev/sdf3 does not support SSD Trim.
[  221.706051] md/raid:md1: /dev/sde3 does not support SSD Trim.
[  221.711786] md/raid:md1: /dev/sdd3 does not support SSD Trim.
[  221.717520] md/raid:md1: /dev/sdc3 does not support SSD Trim.
[  221.723254] md/raid:md1: /dev/sdb3 does not support SSD Trim.
[  221.728992] md/raid:md1: /dev/sda3 does not support SSD Trim.
[  221.734729] md/raid:md1: /dev/sdn3 does not support SSD Trim.
[  221.740461] md/raid:md1: /dev/sdl3 does not support SSD Trim.
[  221.746195] md/raid:md1: /dev/sdj3 does not support SSD Trim.
[  221.751929] md/raid:md1: /dev/sdo3 does not support SSD Trim.
[  221.757666] md/raid:md1: /dev/sdm3 does not support SSD Trim.
[  221.763434] md1: detected capacity change from 0 to 3837846880256
[  221.914574] drbd r1: Starting worker thread (from drbdsetup-84 [4136])
[  221.921501] block drbd1: disk( Diskless -> Attaching )
[  221.926774] drbd r1: Method to ensure write ordering: flush
[  221.932338] block drbd1: max BIO size = 524288
[  221.936773] block drbd1: Adjusting my ra_pages to backing device's (32 -> 512)
[  221.943980] block drbd1: drbd_bm_resize called with capacity == 7495792568
[  221.950907] block drbd1: resync bitmap: bits=7320110 words=114377 pages=224
[  221.957855] block drbd1: size = 3574 GB (3747896284 KB)
[  221.986463] block drbd1: recounting of set bits took additional 0 jiffies
[  221.993249] block drbd1: 3574 GB (7320110 bits) marked out-of-sync by on disk bit-map.
[  222.001157] block drbd1: Suspended AL updates
[  222.005505] block drbd1: disk( Attaching -> UpToDate )
[  222.010717] block drbd1: attached to UUIDs BC2A1D4B533D3097:0000000000000004:0000000000000000:0000000000000000
[  222.046228] drbd r1: conn( StandAlone -> Unconnected )
[  222.051454] drbd r1: Starting receiver thread (from drbd_w_r1 [4137])
[  222.057901] drbd r1: receiver (re)started
[  222.061910] drbd r1: conn( Unconnected -> WFConnection )
[  223.082400] drbd r1: conn( WFConnection -> Disconnecting )
[  223.082406] drbd r1: Discarding network configuration.
[  223.093112] drbd r1: Connection closed
[  223.096868] drbd r1: conn( Disconnecting -> StandAlone )
[  223.102260] drbd r1: receiver terminated
[  223.106175] drbd r1: Terminating drbd_r_r1
[  223.111400] block drbd1: role( Secondary -> Primary )
[  224.957237] flashcache flashcache_ctr
[  224.960905] device-mapper: flashcache: Data device (dm-7) discard unsupported: Disabling discard passdown.
[  224.970540] flashcache slot 2 enable 1
[  224.974334] device-mapper: flashcache: Cache metadata saved to disk
[  224.980592] flashcache flashcache_ctr end slot id 2 dev 253:7
[  224.986379] flashcache slot 2 enable 1
[  225.223221] device-mapper: thin metadata: __create_persistent_data_objects: block manger get correctly
[  225.416332] device-mapper: tier: passdown_tier_discard:4011, tier discard_passdown(4)
[  225.424154] device-mapper: thin metadata: dm_pool_set_mapped_threshold: threshold: 7112616 total_mapped_blocks: 1421824 new_threshold: 7112616
[  225.436908] device-mapper: thin: maybe_resize_data_dev: expand pool origin max threshold to 7112616
[  226.202084] device-mapper: thin metadata: dm_pool_set_mapped_threshold: threshold: 7112616 total_mapped_blocks: 1421824 new_threshold: 7112616
[  228.802111] EXT4-fs (dm-0): Mount option "noacl" will be removed by 3.5
[  228.802111] Contact linux-ext4@vger.kernel.org if you think we should keep it.
[  228.802111]
[  228.905952] ext4_init_reserve_inode_table0: dm-0, 5554
[  228.911083] ext4_init_reserve_inode_table2: dm-0, 5554, 0, 0, 4096
[  228.917486] EXT4-fs (dm-0): mounted filesystem with ordered data mode. Opts: usrjquota=aquota.user,jqfmt=vfsv0,user_xattr,data=ordered,data_err=abort,delalloc,nopriv,nodiscard,noacl
[  229.058589] device-mapper: tier: set allocation tier failed
[  229.106140] BUG: unable to handle kernel NULL pointer dereference at 000000000000000a
[  229.113961] IP: kernfs_refresh_inode+0x21/0xc0
[  229.118395] PGD 8000000874817067 P4D 8000000874817067 PUD 8778cb067 PMD 0
[  229.125259] Oops: 0000 [#1] SMP PTI
[  229.128738] Modules linked in: ipv6 ufsd(PO) jnl(O) pl2303 usbserial qm2_i2c(O) i2c_imc(O) intel_ips drbd lru_cache flashcache(O) dm_tier_hro_algo dm_thin_pool dm_bio_prison dm_persistent_data ha                                       l_netlink(O) k10temp coretemp atlantic(O) igb e1000e mv14xx(PO) mpt3sas scsi_transport_sas raid_class celerity16fc_cfg(O) qla2xxx scsi_transport_fc usb_storage xhci_pci xhci_hcd usblp uhci_hcd ehci_                                       pci ehci_hcd
[  229.164303] CPU: 1 PID: 3761 Comm: storage_util Tainted: P           O    4.14.24-qnap #1
[  229.172462] Hardware name: Default string Z509/B492, BIOS V3WBAR13.BIN 06/19/2019
[  229.179928] task: ffff8808706aa7c0 task.stack: ffffc900019c0000
[  229.185836] RIP: 0010:kernfs_refresh_inode+0x21/0xc0
[  229.190791] RSP: 0018:ffffc900019c3c10 EFLAGS: 00010202
[  229.196006] RAX: 00000000000041ed RBX: 0000000000000002 RCX: 0000000000004000
[  229.203124] RDX: ffff8808706aa7c0 RSI: ffff88087c14b100 RDI: ffff88087b061f80
[  229.210243] RBP: ffffc900019c3c30 R08: ffff88081a63a027 R09: ffff88087c3677d0
[  229.217364] R10: 00000000fca4ab88 R11: 00000003fca4ab88 R12: ffff88087c14b100
[  229.224485] R13: ffff88087b061f80 R14: 00000000ffffffec R15: 0000000000018800
[  229.231605] FS:  00007fb768be8740(0000) GS:ffff88089fc40000(0000) knlGS:0000000000000000
[  229.239677] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  229.245409] CR2: 000000000000000a CR3: 0000000874f70002 CR4: 00000000003606e0
[  229.252530] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[  229.259650] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[  229.266768] Call Trace:
[  229.269212]  kernfs_iop_permission+0x2d/0x50
[  229.273474]  __qnap_inode_permission+0x9e/0x100
[  229.277994]  may_open+0x7f/0xe0
[  229.281126]  path_openat+0x27a/0x1600
[  229.284780]  ? mem_cgroup_uncharge_list+0x54/0x60
[  229.289472]  do_filp_open+0x85/0xf0
[  229.292955]  ? __alloc_fd+0x38/0x160
[  229.296524]  ? do_sys_open+0x11d/0x2b0
[  229.300266]  do_sys_open+0x11d/0x2b0
[  229.303834]  ? __fput+0x154/0x1d0
[  229.307142]  do_syscall_64+0x83/0x2c0
[  229.310800]  entry_SYSCALL_64_after_hwframe+0x3d/0xa2
[  229.315841] RIP: 0033:0x7fb7671c6400
[  229.319407] RSP: 002b:00007ffdf0017bc8 EFLAGS: 00000246 ORIG_RAX: 0000000000000101
[  229.326960] RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007fb7671c6400
[  229.334080] RDX: 0000000000090800 RSI: 00007ffdf0017c10 RDI: ffffffffffffff9c
[  229.341199] RBP: 0000000000000001 R08: 00007ffdf0017bf5 R09: 0000000000000003
[  229.348319] R10: 0000000000000000 R11: 0000000000000246 R12: 00007ffdf0017bf5
[  229.355440] R13: 00007ffdf0017bf0 R14: 0000000000000010 R15: 0000000000000012
[  229.362559] Code: ff eb e5 90 90 90 90 90 90 90 55 48 89 e5 41 56 41 55 41 54 53 49 89 fd 48 8b 5f 78 0f b7 47 72 49 89 f4 48 85 db 66 89 06 74 6a <8b> 43 08 4c 8b 76 28 89 46 04 8b 43 0c 89 46 0                                       8 48 8b 7b 18 48
[  229.381393] RIP: kernfs_refresh_inode+0x21/0xc0 RSP: ffffc900019c3c10
[  229.387818] CR2: 000000000000000a
[  229.391125] ---[ end trace 1b17b1f3bd3a3c60 ]---
^C^Ckernfs_iop_permission


";i:1;N;i:2;N;}i:2;i:4089;}i:3;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:4089;}}