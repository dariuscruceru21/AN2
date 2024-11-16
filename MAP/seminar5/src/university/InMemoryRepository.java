package university;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class InMemoryRepository <T extends HasId> implements Repository<T>{
    Map<Integer,T> map = new HashMap<>();


    @Override
    public void creat(T obj) {
        map.putIfAbsent(obj.getId(),obj);

    }

    @Override
    public T read(Integer id) {
        return map.get(id);
    }

    @Override
    public void update(T obj) {
        map.replace(obj.getId(),obj);

    }

    @Override
    public void delete(Integer id) {
        map.remove(id);

    }

    @Override
    public List<T> getAll() {
        return map.values().stream().toList();
    }
}
