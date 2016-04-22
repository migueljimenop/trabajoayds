import java.util.Arrays;

public class Inversion {

  private int[] numbers;
  private int[] helper;
  private int number;
  private int contador = 0;
  private int cont = 0;

  public void sort(int[] values) {
    this.numbers = values;
    number = values.length;
    this.helper = new int[number];
    mergesort(0, number - 1);
  }

  public void mergesort(int low, int high) {
    // check if low is smaller then high, if not then the array is sorted
    if (low < high) {
      // Get the index of the element which is in the middle
      int middle = low + (high - low) / 2;
      // Sort the left side of the array
      mergesort(low, middle);
      // Sort the right side of the array
      mergesort(middle + 1, high);
      // Combine them both
      merge(low, middle, high);
      //cont = cont + contador;
    }
  }

  public void merge(int low, int middle, int high){
    // Copy both parts into the helper array
    for (int i = low; i <= high; i++) {    
        helper[i] = numbers[i];
    }

    int i = low;
    int j = middle + 1;
    int k = low;
    // Copy the smallest values from either the left or the right side back
    // to the original array
    while (i <= middle && j <= high) {
      if (helper[i] <= helper[j]) {
        numbers[k] = helper[i];        
        i++;
      } else {
       	contador = contador + 1;      	
      	System.out.println(helper[i] + " > " + helper[j] + " inversiones parciales " + contador );
        numbers[k] = helper[j];
        j++;
      }      
      k++;             
    }
    // Copy the rest of the left side of the array into the target array
    //System.out.println("Helpers: " + Arrays.toString(helper));
    //System.out.println("Numbers: " + Arrays.toString(numbers));
	while (i <= middle) {
		if (numbers[k+1] < helper[k]){
			contador = contador + 1;
	    	System.out.println("Restante: "+ helper[i] + " > " + numbers[k] + " inversiones parciales " + contador );
	    }
	   	numbers[k] = helper[i];	     
	   	//System.out.println("Helper[i]" + helper[i] + " numbers[k] " + helper[k]);
	    k++;
	    i++;
	}

}
	

  public int contatoria (){
    return contador;
  }

  public static void main(String[] args) {
      int[] A = {38,16,27,39,12,72};
      Inversion s = new Inversion();
      s.sort(A);
      System.out.println("INVERSION "+ Arrays.toString(A));
      System.out.println("La cantidad de inversiones es: "+ s.contatoria());    
    }
}
