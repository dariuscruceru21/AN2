public class StringOps {
    public String reverse(String str) {
        String result = "";
        for(int i = str.length() - 1; i >= 0; i--){
            result += str.charAt(i);//luam cu charAt un caracter

        }
        return result;
    }

    public int wordCOunt(String word) {
        int count = 0;
        for(int i = 0 ; i < word.length() ; i++){
            if(word.charAt(i) == ' ')
                count += 1;
        }
        return count + 1;
    }

}

