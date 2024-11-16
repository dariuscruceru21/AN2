package university;

import java.io.*;
import java.util.List;
import java.util.Map;
import java.util.function.Consumer;

public class FileRepository<T extends HasId> implements Repository {
    
    private String path;

    public FileRepository(String path) {
        this.path = path;
    }

    public Map<Integer,T> readFromFile(){
        try(
            ObjectInputStream input = new ObjectInputStream(new FileInputStream(path));

        ) {

            return (Map<Integer, T>) input.readObject();

        }
        catch (IOException | ClassNotFoundException e){
            return Map.of();
        }



    }


    public void writeToFile(Map<Integer,T> map){
        try(
                ObjectOutputStream output = new ObjectOutputStream(new FileOutputStream(path));


                ){
            output.writeObject(map);

        }
        catch (IOException e){
            e.printStackTrace();
        }

    }

    void doInFile(Consumer<Map<Integer,T>> consumer ){
        Map<Integer, T> integerTMap = readFromFile();
        consumer.accept(integerTMap);
        writeToFile(integerTMap);
    }



    @Override
    public void creat(T obj) {

        doInFile(map->map.putIfAbsent(obj.getId(),obj));


    }

    @Override
    public HasId read(Integer id) {
        return readFromFile().get(id);
    }

    @Override
    public void update(T obj) {
        doInFile(map->map.replace(obj.getId(),obj));
    }

    @Override
    public void delete(Integer obj) {
        doInFile(map->map.remove(obj);
    }

    @Override
    public List getAll() {
        return readFromFile().values().stream().toList();
    }
}
