package strategy;

public class SubStrategy implements MathStrategy{

    @Override
    public double opperation(double x, double y) {
        return x - y;
    }
}
