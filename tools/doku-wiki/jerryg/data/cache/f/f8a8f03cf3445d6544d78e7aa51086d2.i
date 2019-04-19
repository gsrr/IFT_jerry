a:3:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:309:"
def perms(arr, idx):
    if idx == len(arr):
        print arr
    for i in xrange(idx, len(arr)):
        arr[idx], arr[i] = arr[i], arr[idx]
        perms(arr, idx + 1)
        arr[idx], arr[i] = arr[i], arr[idx]


def main():
    arr = range(1, 4)
    perms(arr,0)

if __name__ == "__main__":
    main()

";i:1;N;i:2;N;}i:2;i:6;}i:2;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:6;}}