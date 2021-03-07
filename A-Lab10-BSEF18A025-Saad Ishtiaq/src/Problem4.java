import java.util.Scanner;
public class Problem4 {

    static Problem4 obj=new Problem4();
    public static void main(String[] args) {
        Scanner userInputArray= new Scanner(System.in);
        int[] numbersArray = new int[10];
        System.out.println("Enter 10 Numbers: " );

        for(int i = 0; i < numbersArray.length; ++i) {
            numbersArray[i]=userInputArray.nextInt();
        }
        System.out.println("\n\nSum is: " + obj.sum(numbersArray));
        System.out.println("Average is: " + obj.average(numbersArray));
        System.out.println("Largest is: " + obj.largest(numbersArray));
        System.out.println("Smallest is: " + obj.smallest(numbersArray));
    }

    public int sum( int arr[])
    {
        int arraySum=0;
        for (int key: arr) {
            arraySum=arraySum+key;
        }
        return  arraySum;
    }

    public double average (int arr[])
    {
        return ((double) (obj.sum(arr))/arr.length);
    }

    public int largest (int arr[])
    {
        int max=0;
        for (int key:arr)
        {
            if(key>max)
            {
                max=key;
            }
        }
        return max;
    }

    public int smallest (int arr[])
    {
        int min=0;
        for (int key:arr)
        {
            if(key<min)
            {
                min=key;
            }
        }
        return min;
    }
}

