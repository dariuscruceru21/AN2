package university;

import java.util.ArrayList;
import java.util.List;

public class Course implements HasId {
    private Integer id, availableSlots, credits;
    private String courseName;
    private Teacher teacher;
    private List<Student> students = new ArrayList<>();

    public Course(Integer id, Integer availableSlots, Integer credits, String courseName, Teacher teacher, List<Student> students) {
        this.id = id;
        this.availableSlots = availableSlots;
        this.credits = credits;
        this.courseName = courseName;
        this.teacher = teacher;
        this.students = students;
    }

    @Override
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getAvailableSlots() {
        return availableSlots;
    }

    public void setAvailableSlots(Integer availableSlots) {
        this.availableSlots = availableSlots;
    }

    public Integer getCredits() {
        return credits;
    }

    public void setCredits(Integer credits) {
        this.credits = credits;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public Teacher getTeacher() {
        return teacher;
    }

    public void setTeacher(Teacher teacher) {
        this.teacher = teacher;
    }

    public List<Student> getStudents() {
        return students;
    }

    public void setStudents(List<Student> students) {
        this.students = students;
    }

    @Override
    public String toString() {
        return "Course{" +
                "id=" + id +
                ", availableSlots=" + availableSlots +
                ", credits=" + credits +
                ", courseName='" + courseName + '\'' +
                ", teacher=" + teacher +
                ", students=" + students +
                '}';
    }
}
