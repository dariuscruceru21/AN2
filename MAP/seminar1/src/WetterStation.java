public class WetterStation {
    public int[] temperature;

    public WetterStation(int[] temp) {//constructor
        this.temperature = temp;
    }

    public double average() {
        double sum = 0;
        for (int i = 0; i < this.temperature.length; i++) {
            sum += this.temperature[i];
        }
        return sum / this.temperature.length;
    }

    public int[] MinUndMax(){
        int min = this.temperature[0];
        int max = this.temperature[0];
        for (int i = 0; i < this.temperature.length; i++){
            if(this.temperature[i] < min)
                min = this.temperature[i];
            if(this.temperature[i] > max)
                max = this.temperature[i];
        }

        int[] minMax = new int[] {min, max};
        return minMax;
    }


    private static int absT(int x, int y ){
        if(x > y)
            return x - y;
        else
            return y - x;
    }
    public int MaxDif(){
        int index = -1;
        int maxDif = -10000;
        for(int i = 1 ; i< this.temperature.length; i++){
            int diff = absT(this.temperature[i - 1], this.temperature[i]);
            if(diff > maxDif){
                maxDif = diff;
                index = i - 1;
            }
        }
        return index;
    }
}
