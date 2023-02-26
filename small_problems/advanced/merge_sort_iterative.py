# Iterative merge sort (bottom up) from Geeksforgeeks
# Contributed by Madhur Chhangani [RCOEM] 
# corrected and improved by @mahee96

def merge(a, l, m, r):
    n1 = m - l + 1
    n2 = r - m
    L = [0] * n1
    R = [0] * n2
    for i in range(0, n1):
        L[i] = a[l + i]
    for i in range(0, n2):
        R[i] = a[m + i + 1]
    
    i, j, k = 0, 0, l
    while i < n1 and j < n2:
        if L[i] <= R[j]:
            a[k] = L[i]
            i += 1
        else:
            a[k] = R[j]
            j += 1
        k += 1
    
    while i < n1:
        a[k] = L[i]
        i += 1
        k += 1
    
    while j < n2:
        a[k] = R[j]
        j += 1
        k += 1
    
def mergeSort(a):
    # start with least partition size of 2^0 = 1
    width = 1

    n = len(a)

    # subarray size grows by powers of 2
    # since growth of loop condition is exponential,
    # time consumed is logarithmic O(log2(n))
    while (width < n):
        # always start from leftmost
        l=0
        while (l < n):
            # final merge should consider
            # unmerged sublist if input arr
            # size is not pwer of 2
            r = min(l+(width*2-1), n-1)
            m = min(l+width-1, n-1)

            merge(a, l, m, r)
            l += width * 2
        # increasing sub-array size by powers of 2
        width *= 2
    return a

a = [-74,48,-20,2,10,-84,-5,-9,11,-24,-91,2,-71,64,63,80,28,-30,-58,-11,-44,-87,-22,54,-74,-10,-55,-28,-46,29,10,50,-72,34,26,25,8,51,13,30,35,-8,50,65,-6,16,-2,21,-78,35,-13,14,23,-3,26,-90,86,25,-56,91,-13,92,-25,37,57,-20,-69,98,95,45,47,29,86,-28,73,-44,-46,65,-84,-96,-24,-12,72,-68,93,57,92,52,-45,-2,85,-63,56,55,12,-85,77,-39]
print("Given array is ")
print(a)
mergeSort(a)

print("Sorted array is ")
print(a)
