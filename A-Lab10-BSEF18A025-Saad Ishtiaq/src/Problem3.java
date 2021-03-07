import java.util.Scanner;

public class Problem3 {
    public static void main(String[] args) {

        Scanner userInputIntegralValue = new Scanner(System.in);
        System.out.println("Enter a Integral Value: ");
        int intergralValue = userInputIntegralValue.nextInt();

        if (intergralValue < 0) {
            System.out.println("It is Negative Value. i.e  " + intergralValue );
        } else {
            System.out.println("It is Positive Value. i.e  " + intergralValue);
        }
    }
}
