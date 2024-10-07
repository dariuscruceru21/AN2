public class ArabicToNumeral {
    public int romanToArabic(String roman){
        int result = 0;

        for(int i = 0; i < roman.length(); i++){
            if(roman.charAt(i) < roman.charAt(i + 1))
                result += roman.charAt(i + 1) - roman.charAt(i);
            else
                result += roman.charAt(i) + roman.charAt(i + 1);
        }
    }
}
