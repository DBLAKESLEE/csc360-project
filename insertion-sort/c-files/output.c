#include <stdio.h>

#include "insertion.c"

void printArray(int arr[], int n){

	for (int i = 0; i < n; i++){
    printf("%d\t", arr[i]);
	}

  printf("\n");
}

int main(void){

	int arr[] = {4, 5, -1, 100, 1, 22};
  int n = sizeof(arr) / sizeof(arr[0]);

  printf("Unsorted array: ");
  printArray(arr, n);

  insertionSort(arr, n);

  printf("  Sorted array: ");
  printArray(arr, n);

  return 0;
}
