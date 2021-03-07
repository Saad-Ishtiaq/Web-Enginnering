import java.util.*;
public class Problem5 {
    public static void main(String args[]) {


        Scanner encrytedMessage = new Scanner(System.in);

        System.out.println("Enter the Encrypted message : ");
        String textToBeDecrypted = encrytedMessage.nextLine();
        String decryptedMessage = "";


        for(int i=0; i < textToBeDecrypted.length();i++)
        {
            char singleCharacter = textToBeDecrypted.charAt(i);

            if(singleCharacter >= 'A' && singleCharacter <= 'Z')
            {
                singleCharacter = (char) (singleCharacter - 5);
                if (singleCharacter < 'A') {
                    singleCharacter = (char) (singleCharacter-'A'+'Z'+1);
                }
                decryptedMessage = decryptedMessage + singleCharacter;
            }

            else if(singleCharacter >= 'a' && singleCharacter <= 'z')
            {
                singleCharacter = (char) (singleCharacter - 5);
                if(singleCharacter < 'a') {
                    singleCharacter = (char) (singleCharacter-'a'+'z'+1);
                }
                decryptedMessage = decryptedMessage + singleCharacter;
            }
            else // for spaces to printed as it is
            {
                decryptedMessage = decryptedMessage + singleCharacter;
            }
        }
        System.out.println("Decrypted message: " + decryptedMessage);
    }
}