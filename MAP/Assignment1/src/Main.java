import java.lang.reflect.Array;
import java.util.Arrays;

public class Main {
    public static void main(String[] args) {
        Aufgabe1 array = new Aufgabe1();
        int[] testArray = {29, 37, 38, 41, 84, 67};
        int[] newArray = array.notEnoughGrade(testArray);
        int[] roundedGrades = array.roundedGrades(testArray);



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

    }
}