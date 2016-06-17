#!/bin/bash
fcheduleRR create -tp single -sf /2537E3866F7832ED/f1/f1 -st nas -a 172.27.112.219 -u aa -pw aa -D /23596A1A0A449242/Volume_A/folder1 -e on -s on -n aaa -t weekly -d wed -T 2300 -sd 20160622 -et 0000 -E off -p 10m -z a@0
rm -rf /2537E3866F7832ED/f1/f1/*
touch /2537E3866F7832ED/f1/f1/file_test_1
replicate start RR_20160617104018 -z a@0
#check target file

