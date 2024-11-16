package strategy;

public class AddStrategy implements MathStrategy{
    @Override
    public double opperation(double x, double y) {
        return x + y;
    }
}
