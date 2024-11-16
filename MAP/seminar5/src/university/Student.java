package university;
import java.util.ArrayList;
import java.util.List;

public class Student extends  Person{

    private List<Course> cOurses = new ArrayList<>();

    protected Student(Integer id, String name) {
        super(id, name);
    }

    @Override
    public String toString() {
        return "Student{" +
                "cOurses=" + cOurses +
                ", id=" + getId() +
                ", name='" + getName() + '\'' +
                '}';
    }
}
