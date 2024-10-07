public class ex1 {
    public double add(double x, double y) {
        return x + y;
    }

    public double sub(double x, double y) {
        return x - y;
    }

    public double mul(double x, double y) {
        double result = 0;
        for (int i = 1; i <= y; i++)
            result += x;
        return result;
    }

    public boolean isPerfect(int number) {
        int divSum = 1;
        for (int i = 2; i <= number / 2; i++) {
            if (number % i == 0) {
                divSum += i;
            }
        }

        return divSum == number;
    }
}
