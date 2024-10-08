public class Aufgabe2 {
    int n;
    int[] array;

    public Aufgabe2(int n, int[] array) {
        this.n = n;
        this.array = array;
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

    public int maxSumWithoutOneNr(){
        int maxSum = 0;
        int min = minNr();
        for (int i = 0 ; i<this.n;i++)
            if(this.array[i]!= min)
                maxSum += this.array[i];
        return maxSum;
    }

    public int minSumWithoutOneNr(){
        int minSum = 0;
        int max = maxNr();
        for (int i = 0 ; i<this.n;i++)
            if(this.array[i]!=max)
                minSum += this.array[i];
        return minSum;

    }
}
