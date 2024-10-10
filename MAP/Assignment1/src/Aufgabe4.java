public class Aufgabe4 {

    public int cheapestKeyboard(int[] keyboards){
        int min = Integer.MAX_VALUE;
        for(int i = 0 ; i < keyboards.length;i++)
            if(keyboards[i] < min)
                min = keyboards[i];
        return min;
    }

    public int mostExpensiveItem(int[] keyboards, int[] usb){
        int max = 0;
        for(int i = 0 ; i < keyboards.length;i++)
            if(keyboards[i] > max)
                max = keyboards[i];
        for(int i = 0; i<usb.length;i++)
            if(usb[i] > max)
                max = usb[i];
        return max;
    }

    public int mostExpensiveInBudget(int[] usb, int budget){
        int max = 0;
        for(int i = 0 ; i < usb.length;i++)
            if(usb[i] > max && usb[i] <= budget)
                max = usb[i];
        return max;
    }

    public int inBudgetCombination(int[] keyboards, int[] usb, int budget){
        int max = -1;
        for(int i = 0 ; i < keyboards.length;i++) {
            for (int j = 0; j < usb.length; j++) {
                int total = keyboards[i] + usb[j];
                if(total <= budget && max < total)
                    max = total;

            }

        }
        return max;

    }


}
