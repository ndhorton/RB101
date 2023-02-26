// From geeks4geeks

#include <stdio.h>

/* Function to merge the two halves
   array[l..m] and arr[m+1..r] of array arr[] */
void merge(int arr[], int l, int m, int r)
{
    int i, j, k;
    int n1 = m - l + 1;
    int n2 = r - m;

    // create temp arrays
    int L[n1], R[n2];

    // Copy data to temp arrays L[] and R[]
    for (i = 0; i < n1; i++)
        L[i] = arr[l + i];
    for (j = 0; j < n2; j++)
        R[j] = arr[m+1 + j];
    
    // Merge the temp arrays back into arr[l..r]
    i = 0;
    j = 0;
    k = l;
    while (i < n1 && j < n2)
    {
        if (L[i] <= R[j])
        {
            arr[k] = L[i];
            i++;
        }
        else
        {
            arr[k] = R[j];
            j++;
        }
        k++;
    }

    /* Copy the remaining elments of L[]
       if there are any */
    while (i < n1)
    {
        arr[k] = L[i];
        i++;
        k++;
    }

    /* Copy the remaining elements of R[]
       if there are any */
    while (j < n2)
    {
        arr[k] = R[j];
        j++;
        k++;
    }
}

/* l is for left index and r is
   right index of the sub-array
   of arr[] to be sorted */
void mergeSort(int arr[], int l, int r)
{
    if (l < r)
    {
        // Same as (l+r)/2 but avoids
        // overflow for large l and r
        int m = l + (r-l)/2;
        mergeSort(arr, l, m);
        mergeSort(arr, m+1, r);
        merge(arr, l, m, r);
    }
}

void printArray(int A[], int size)
{
    for (int i = 0; i < size; i++)
    {
        printf("%i ", A[i]);
    }
    putchar('\n');
}

int main(void)
{
    int arr[] = { 58, 3, 29, 44, 28, 65, 56, 29 };
    printf("Array before mergeSort: ");
    printArray(arr, sizeof(arr)/sizeof(arr[0]));

    mergeSort(arr, 0, sizeof(arr)/sizeof(arr[0]) - 1);

    printf("Array after mergeSort: ");
    printArray(arr, sizeof(arr)/sizeof(arr[0]));
    return 0;
}