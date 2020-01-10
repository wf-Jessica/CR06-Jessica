package sample;

public class teacher {
    private int id;
    private String name;
    private String surname;
    private String email;

    public teacher(int  id, String name, String surname,String email) {
        this.id = id;
        this.name = name;
        this.surname = surname;
        this.email= email;
    }

    @Override
    public String toString() {
        return name+","+ surname; // used for a display in a ListView
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
