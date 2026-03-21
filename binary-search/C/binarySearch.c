#include <stdio.h>

int binarySearch(int arr[], int len, int search){
    int left = 0;
    int right = len - 1;

    while(left <= right){
        //int mid = left + ((right - left) / 2);
        int mid = (left + right) / 2;

        if(arr[mid] == search){
            return mid;
        }else if(arr[mid] < search){
            left = mid + 1;
        }else if(arr[mid] > search){
            right = mid - 1;
        }
    }

    return -1;
}

int main(){
    int arr[] = {2, 5, 8, 12, 16, 23, 38, 56, 72, 91};
    int size = sizeof(arr) / sizeof(arr[0]);

    int result = binarySearch(arr, size, 116);
    
    if(result == -1){
        printf("Element is not present in array\n");
    }else{
        printf("Element is present at index %d\n", result);
    }
    
    return 0;
}