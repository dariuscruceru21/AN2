package kiste;

public class Haemar implements Sache{

    private double weight;

    public Haemar(double weight ){
        this.weight = weight;
    }
    @Override
    public double getWeight() {
        return weight;
    }

    @Override
    public boolean canCut() {
        return false;
    }

    @Override
    public String toString(){
        return "Haemmer{" +
                "weight=" + weight +
                '}';
    }
}
