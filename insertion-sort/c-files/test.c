int main(void){
	
	int arr[] = {4, 5, -1, 100, 1, 22};
	int n = 6;

	for (int i = 1; i < n; i++){
 		int current = arr[i];
  	int j = i - 1;

   	while (j >= 0 && arr[j] > current){
    	arr[j + 1] = arr[j];
      j = j - 1;
    }

    arr[j + 1] = current;
	}
}
