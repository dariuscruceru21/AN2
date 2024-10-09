public class Aufgabe3 {

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
            if(diff < 0){
                diff += 10;
                borrow = 1;
            }else
                borrow = 0;
            result[i] = diff;

        }
        return result;
    }

    public int[] mul(int[] num1, int multiplier){
        int carry = 0;
        int[] result = new int[num1.length];
        for(int i = num1.length - 1; i >=0;i--){
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

    public  int[] divide(int[] num, int divisor) {
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
