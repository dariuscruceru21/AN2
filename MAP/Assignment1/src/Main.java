import java.lang.reflect.Array;
import java.util.Arrays;

public class Main {
    public static void main(String[] args) {
        Aufgabe1 array = new Aufgabe1();
        int[] testArray = {29, 37, 38, 41, 84, 67};
        int[] newArray = array.notEnoughGrade(testArray);
        int[] roundedGrades = array.roundedGrades(testArray);
        Aufgabe3 aufgabe3 = new Aufgabe3();
        int[] bigNumber1 = {1,3,0,0,0,0,0,0,0};
        int[] bigNumber2 = {8,7,0,0,0,0,0,0,0};
        int[] bigNumber3 = {8,3,0,0,0,0,0,0,0};
        int[] bigNumber4 = {5,4,0,0,0,0,0,0,0};
        int[] bigNumber5 = {2,3,6,0,0,0,0,0,0};
        int[] keyboards = {40,35,70,15,45};
        int[] keyboards2 = {15, 20, 10, 35};
        int[] usb = {20,15,40,15};
        int[] usb2 = {15, 45, 20};

        int[] keyboards3 = {40,50,60};
        int[] usb3 = {8,12};

        int[] keyboards4 = {60};

        int[] keyboards5 = {40,60};


        Aufgabe4 aufgabe4 = new Aufgabe4();




        //prints the array if grades that are not enough
        System.out.println(Arrays.toString(newArray));

        //Average of the Grades
        System.out.println(array.averageGrade(testArray));

        //Rounded up grades
        System.out.println(Arrays.toString(roundedGrades));

        //Max rounded Grade
        System.out.println("The Maximum rounded Grade is : " +array.maxRoundedGrade(testArray));

        //Array for Exercise 2
        Aufgabe2 aufgabe2 = new Aufgabe2(5, new int[]{4, 8, 3, 10, 17});
        System.out.println("The Maximum number is: " + aufgabe2.maxNr());
        System.out.println("The Minimum number is: " +aufgabe2.minNr());
        System.out.println("The Maximum Sum of n - 1 numebrs  is: " +aufgabe2.maxSumWithoutOneNr());
        System.out.println("The Minimum Sum of n - 1 numebrs  is: " +aufgabe2.minSumWithoutOneNr());

        //Sum of two big Numbers
        System.out.println("Sum of the two big Numbers: " + Arrays.toString(aufgabe3.sum(bigNumber1,bigNumber2)));

        //Diffrence of two big numbers
        System.out.println("Diff of the two big NUmbers: " + Arrays.toString(aufgabe3.diff(bigNumber3,bigNumber4)));

        //Multiplicaton
        System.out.println("Multiplication of the big Number: " + Arrays.toString(aufgabe3.mul(bigNumber5,2)));

        //Division
        System.out.println("Division of the big Number: " + Arrays.toString(aufgabe3.divide(bigNumber5,2)));

        System.out.println(aufgabe4.cheapestKeyboard(keyboards));

        System.out.println(aufgabe4.mostExpensiveItem(keyboards2,usb));

        System.out.println(aufgabe4.mostExpensiveInBudget(usb2, 30));

        System.out.println(aufgabe4.inBudgetCombination(keyboards3,usb3,60));

        System.out.println(aufgabe4.inBudgetCombination(keyboards4,usb3,60));

        System.out.println(aufgabe4.inBudgetCombination(keyboards5,usb3,60));




    }
}