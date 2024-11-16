package strategy;

public class MullStrategy implements MathStrategy {
    @Override
    public double opperation(double x, double y) {
        return x * y;
    }
}
