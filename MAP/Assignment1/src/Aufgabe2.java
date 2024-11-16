public class Aufgabe2 {
    int n;
    int[] array;

    public Aufgabe2(int n, int[] array) {
        this.n = n;
        this.array = array;
    }

    public static void main(String[] args) {
        Aufgabe2 aufgabe2 = new Aufgabe2(6, new int[]{4, 8, 3, 10, 17, 3});
        System.out.println("The Maximum number is: " + aufgabe2.maxNr());
        System.out.println("The Minimum number is: " + aufgabe2.minNr());
        System.out.println("The Maximum Sum of n - 1 numebrs  is: " + aufgabe2.maxSumWithoutOneNr());
        System.out.println("The Minimum Sum of n - 1 numebrs  is: " + aufgabe2.minSumWithoutOneNr());

    }

    public int maxNr() {
        int max = 0;
        for (int i = 0; i < this.n; i++)
            if (this.array[i] > max)
                max = this.array[i];
        return max;
    }

    public int minNr() {
        int min = Integer.MAX_VALUE;
        for (int i = 0; i < this.n; i++)
            if (this.array[i] < min)
                min = this.array[i];
        return min;
    }

    public int maxSumWithoutOneNr() {
        int maxSum = 0;
        int min = minNr();
        for (int i = 0; i < this.n; i++)
                maxSum += this.array[i];
        return maxSum - min;
    }

    public int minSumWithoutOneNr() {
        int minSum = 0;
        int max = maxNr();
        for (int i = 0; i < this.n; i++)
            minSum += this.array[i];
        return minSum - max;

    }
}
