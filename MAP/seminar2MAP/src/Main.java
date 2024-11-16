import java.util.Date;
import java.util.List;

import kiste.Scheren;
import kiste.Saegen;
import kiste.Haemar;
import kiste.Naegel;
import kiste.Kiste;
import strategy.AddStrategy;
import strategy.DivStrategy;
import strategy.MathStrategy;
import strategy.MullStrategy;
import strategy.SubStrategy;


public class Main {
    public static void main(String[] args) {

        Kiste kiste = new Kiste();
        kiste.add(new Haemar(1.2));
        kiste.add(new Haemar(0.8));
        kiste.add(new Naegel());
        kiste.add(new Naegel());
        kiste.add(new Naegel());
        kiste.add(new Saegen(1.2));
        kiste.add(new Scheren(0.8));

        System.out.println(kiste);
        System.out.println(kiste.heavyObject());
        System.out.println(kiste.canCut());

        String math = "3*2+1";

        double acc = Double.parseDouble(math.substring(0,1));

        for (int i = 1; i < math.length(); i += 2) {
            acc = getStrategy(math.charAt(i)).opperation(acc, Double.parseDouble(math.substring(i + 1, i + 2)));
        }
        System.out.println(acc);
    }

    static MathStrategy getStrategy(char c) {
        return switch (c) {
            case '+' -> new AddStrategy();
            case '-' -> new SubStrategy();
            case '*' -> new MullStrategy();
            case '/' -> new DivStrategy();
            default -> null;
        };
    }
}