a:3:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:159:"
# Add a SCSI Device back
echo "- - -" > /sys/class/scsi_host/host<h>/scan

# Deletion of a SCSI Device
echo 1 > /sys/class/scsi_device/h:c:t:l/device/delete

";i:1;N;i:2;N;}i:2;i:6;}i:2;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:6;}}