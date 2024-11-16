public class Aufgabe4 {

    public static void main(String[] args) {
        Aufgabe4 aufgabe4 = new Aufgabe4();
        int[] keyboards = {40, 35, 70, 15, 45};
        int[] keyboards2 = {15, 20, 10, 35};
        int[] usb = {20, 15, 40, 15};
        int[] usb2 = {15, 45, 20};
        int[] keyboards3 = {40, 50, 60};
        int[] usb3 = {8, 12};
        int[] keyboards4 = {60};
        int[] keyboards5 = {40, 60};
        System.out.println("Cheapest Keyboard: " + aufgabe4.cheapestKeyboard(keyboards));

        System.out.println("Most expensive Item: " + aufgabe4.mostExpensiveItem(keyboards2, usb));

        System.out.println("Most expensive budget that I can buy: " + aufgabe4.mostExpensiveInBudget(usb2, 30));

        System.out.println("Combination of items in budget: " + aufgabe4.inBudgetCombination(keyboards4, usb3, 60));


    }

    public int cheapestKeyboard(int[] keyboards) {
        int min = Integer.MAX_VALUE;
        for (int i = 0; i < keyboards.length; i++)
            if (keyboards[i] < min)
                min = keyboards[i];

        return min;
    }

    public int mostExpensiveItem(int[] keyboards, int[] usb) {
        int max = 0;
        for (int i = 0; i < keyboards.length; i++)
            if (keyboards[i] > max)
                max = keyboards[i];
        for (int i = 0; i < usb.length; i++)
            if (usb[i] > max)
                max = usb[i];
        return max;
    }

    public int mostExpensiveInBudget(int[] usb, int budget) {
        int max = 0;
        for (int i = 0; i < usb.length; i++)
            if (usb[i] > max && usb[i] <= budget)
                max = usb[i];
        return max;
    }

    public int inBudgetCombination(int[] keyboards, int[] usb, int budget) {
        int max = -1;
        for (int i = 0; i < keyboards.length; i++) {
            for (int j = 0; j < usb.length; j++) {
                int total = keyboards[i] + usb[j];
                if (total <= budget && max < total)
                    max = total;

            }

        }
        return max;

    }


}
