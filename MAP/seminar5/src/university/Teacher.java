package university;

public class Teacher extends Person {

    public Teacher(Integer id, String name) {
        super(id, name);
    }

    @Override
    public String toString() {
        return "Teacher{" +
                "id=" + getId() +
                ", name='" + getName() + '\'' +
                '}';
    }
}
