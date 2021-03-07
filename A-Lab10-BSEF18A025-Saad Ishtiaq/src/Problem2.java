import java.util.Scanner;

public class Problem2 {
    public static void main(String[] args) {

        Scanner userInput= new Scanner(System.in);

        System.out.println("Movie Name:");
        String movieName=userInput.nextLine();

        System.out.println("Movie Genre:");
        String movieGenre=userInput.nextLine();

        System.out.println("Movie Year:");
        int movieYear= userInput.nextInt();

        System.out.println("Movie Length");
        float movieLength=userInput.nextFloat();

        System.out.println("\n\nDisplaying Data...\n\n");


        System.out.println("Name Entered:" + movieName + "\n"+
                "Genre Entered:" + movieGenre + "\n"+
                "Year Entered:" + movieYear +"\n"+
                "Length Entered:" + String.format("%.2f", movieLength));
    }
}

