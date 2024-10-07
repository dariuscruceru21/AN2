public class Main {
    public static void main(String[] args) {
        ex1 MatheAufgabe = new ex1();
        StringOps stringOps = new StringOps();
        WetterStation temperature = new WetterStation(new int[]{12, 14, 9, 12, 15, 16, 15, 15, 11, 8, 13, 13, 15, 12});


        double x = 1.3;
        double y = 0.9;

        System.out.println(MatheAufgabe.add(x, y));
        System.out.println(MatheAufgabe.sub(x, y));
        System.out.println(MatheAufgabe.mul(x, 3));
        System.out.println(stringOps.reverse("Hello World"));
        System.out.println(stringOps.wordCOunt("Salut am venit acasa"));
        System.out.println(MatheAufgabe.isPerfect(28));
        System.out.println(temperature.average());
        System.out.println(temperature.MinUndMax()[0] + " " + temperature.MinUndMax()[1]);
        System.out.println(temperature.MaxDif());

    }
}