public class Aufgabe1 {

    public int[] notEnoughGrade(int[] grades) {
        int newSize = 0;
        int[] newGrades = new int[0];
        for (int i = 0; i < grades.length; i++)
            if (grades[i] < 40) {
                //temporary array to store values
                int[] temp = new int[newSize + 1];
                for (int j = 0; j < newSize; j++)
                    temp[j] = newGrades[j];
                temp[newSize] = grades[i];
                newGrades = temp;
                newSize++;
            }
        return newGrades;

    }

    public double averageGrade(int[] grades) {
        double sum = 0;
        for (int i = 0; i < grades.length; i++)
            sum += grades[i];
        double average = sum / grades.length;
        return Math.round(average * 100.0) / 100.0;
    }

    public int[] roundedGrades(int[] grades) {
        int[] roundedGrades = new int[grades.length];

        for (int i = 0; i < grades.length; i++) {
            int grade = grades[i];

            if (grade >= 38) {
                int nextMul = ((grade / 5) + 1) * 5;
                if (nextMul - grade < 3)
                    grade = nextMul;
            }
            roundedGrades[i] = grade;
        }
        return roundedGrades;
    }

    public int maxRoundedGrade(int[] grades) {
        int[] tempGrades = roundedGrades(grades);
        int max = 0;
        for (int i = 0; i < tempGrades.length; i++)
            if (tempGrades[i] > max)
                max = tempGrades[i];
        return max;


    }
}
