package university;

import java.util.List;
import java.util.Map;

public interface Repository<T extends HasId> {



     void creat(T obj);
     T read(Integer id);
     void update(T obj);
     void delete(Integer id);

     List<T> getAll();

}
