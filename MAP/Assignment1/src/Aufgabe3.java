import java.util.Arrays;

public class Aufgabe3 {

    public static void main(String[] args) {
        Aufgabe3 aufgabe3 = new Aufgabe3();
        int[] bigNumber1 = {1, 3, 0, 0, 0, 0, 0, 0, 0};
        int[] bigNumber2 = {8, 7, 0, 0, 0, 0, 0, 0, 0};
        int[] bigNumber3 = {8, 3, 0, 0, 0, 0, 0, 0, 0};
        int[] bigNumber4 = {5, 4, 0, 0, 0, 0, 0, 0, 0};
        int[] bigNumber5 = {2, 3, 6, 0, 0, 0, 0, 0, 0};
        //Sum of two big Numbers
        System.out.println("Sum of the two big Numbers: " + Arrays.toString(aufgabe3.sum(bigNumber1, bigNumber2)));

        //Diffrence of two big numbers
        System.out.println("Diff of the two big NUmbers: " + Arrays.toString(aufgabe3.diff(bigNumber3, bigNumber4)));

        //Multiplicaton
        System.out.println("Multiplication of the big Number: " + Arrays.toString(aufgabe3.mul(bigNumber5, 1)));

        //Division
        System.out.println("Division of the big Number: " + Arrays.toString(aufgabe3.divide(bigNumber5, 2)));
    }

    public int[] sum(int[] num1, int[] num2) {
        int carry = 0;
        int[] result = new int[num1.length];
        for (int i = num1.length - 1; i >= 0; i--) {
            int sum = num1[i] + num2[i] + carry;
            result[i] = sum % 10;
            carry = sum / 10;
        }

        if (carry > 0) {
            int[] extendedResult = new int[num1.length + 1];
            for (int i = 0; i < result.length; i++)
                extendedResult[i + 1] = result[i];
            extendedResult[0] = carry;
            return extendedResult;
        }
        return result;


    }

    public int[] diff(int[] num1, int[] num2) {
        int borrow = 0;
        int[] result = new int[num1.length];
        for (int i = num1.length - 1; i >= 0; i--) {
            int diff = num1[i] - num2[i] - borrow;
            if (diff < 0) {
                diff += 10;
                borrow = 1;
            } else

                borrow = 0;
            result[i] = diff;

        }
        return result;
    }

    public int[] mul(int[] num1, int multiplier) {
        int carry = 0;
        int[] result = new int[num1.length];
        for (int i = num1.length - 1; i >= 0; i--) {
            int mul = num1[i] * multiplier + carry;
            result[i] = mul % 10;
            carry = mul / 10;
        }

        if (carry > 0) {
            int[] extendedResult = new int[num1.length + 1];
            for (int i = 0; i < result.length; i++)
                extendedResult[i + 1] = result[i];
            extendedResult[0] = carry;
            return extendedResult;
        }
        return result;
    }

    public int[] divide(int[] num, int divisor) {
        int[] result = new int[num.length];
        int remainder = 0;

        for (int i = 0; i < num.length; i++) {
            int current = remainder * 10 + num[i];
            result[i] = current / divisor;
            remainder = current % divisor;
        }

        // Entfernen führender Nullen manuell
        int nonZeroIndex = 0;
        while (nonZeroIndex < result.length && result[nonZeroIndex] == 0) {
            nonZeroIndex++;
        }

        // Wenn alle Stellen 0 sind, geben wir ein einzelnes 0-Array zurück
        if (nonZeroIndex == result.length) {
            return new int[]{0};
        }

        int[] finalResult = new int[result.length - nonZeroIndex];
        for (int i = 0; i < finalResult.length; i++) {
            finalResult[i] = result[nonZeroIndex + i];
        }

        return finalResult;
    }
}
