package movie;

import java.util.List;

public class ComedyMovie extends Movie{
    public ComedyMovie(String titel, int year, double rating, List<String> cast, double basePrice){
       super(titel,year,rating,cast,basePrice);
    }


    public double calculatePrice(){
        if (cast.contains("Adam Sandler")) {
            return basePrice * 0.5;
        } else {
            return basePrice;
        }
    }
}
