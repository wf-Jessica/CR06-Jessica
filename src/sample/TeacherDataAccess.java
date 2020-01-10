
package sample;

        import java.sql.SQLException;
        import java.sql.DriverManager;
        import java.sql.Connection;
        import  java.sql.PreparedStatement;
        import java.sql.ResultSet;
        import  java.util.List;
        import java.util.ArrayList;

public  class TeacherDataAccess {

    private Connection conn;
    private static final String todoTable = "teacher";

    public TeacherDataAccess()
            throws SQLException, ClassNotFoundException {

        // Class.forName("org.hsqldb.jdbc.JDBCDriver" );

        //STEP 2: Check if JDBC driver is available
        Class.forName( "com.mysql.cj.jdbc.Driver");
        //STEP 3: Open a connection
        System.out.println("Connecting to database...");
        conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/cr6" +
                        "?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC" ,
                "root",
                "");

        // we will use this connection to write to a file
        conn.setAutoCommit(true);
        conn.setReadOnly( false);
    }

    public void closeDb() throws SQLException {
        conn.close();
    }

    /**
     * Get all db records
     * @return
     * @throws SQLException
     */
    public List<teacher> getAllRows()   throws SQLException {

        String sql = "SELECT * FROM " + todoTable + " ORDER BY name" ;
        PreparedStatement pstmnt = conn.prepareStatement(sql);
        ResultSet rs = pstmnt.executeQuery();
        List<teacher> list = new ArrayList<>();

        while  (rs.next()) {
            int i = rs.getInt("id" );
            String name = rs.getString("name" );
            String surname = rs.getString("surname" );
            String email = rs.getString("email" );
            list.add( new teacher(i, name, surname,email));
        }

        pstmnt.close(); // also closes related result set
        return list;
    }


    public  boolean nameExists(teacher todo) throws SQLException {

        String sql = "SELECT COUNT(id) FROM " + todoTable + " WHERE name = ? AND id <> ?" ;
        PreparedStatement pstmnt = conn.prepareStatement(sql);
        pstmnt.setString( 1 , todo.getName());
        pstmnt.setInt( 2 , todo.getId());
        ResultSet rs = pstmnt.executeQuery();
        rs.next();
        int  count = rs.getInt( 1 );
        pstmnt.close();

        if  (count > 0 ) {

            return   true ;
        }

        return   false ;
    }

    public   int  insertRow(teacher todo)
            throws  SQLException {

        String dml = "INSERT INTO "  + todoTable + " VALUES (DEFAULT, ?, ?)" ;
        PreparedStatement pstmnt = conn.prepareStatement(dml,
                PreparedStatement.RETURN_GENERATED_KEYS);
        pstmnt.setString( 1 , todo.getName());
        pstmnt.setString( 2 , todo.getSurname());
        pstmnt.executeUpdate(); // returns insert count

        // get identity column value
        ResultSet rs = pstmnt.getGeneratedKeys();
        rs.next();
        int  id = rs.getInt( 1 );

        pstmnt.close();
        return  id;
    }

    public   void  updateRow(teacher todo)
            throws  SQLException {

        String dml = "UPDATE "  + todoTable +
                " SET name = ?, description = ? "  + " WHERE id = ?" ;
        PreparedStatement pstmnt = conn.prepareStatement(dml);
        pstmnt.setString( 1 , todo.getName());
        pstmnt.setString( 2 , todo.getSurname());
        pstmnt.setInt( 3 , todo.getId());
        pstmnt.executeUpdate(); // returns update count
        pstmnt.close();
    }

    public   void  deleteRow(teacher todo)
            throws  SQLException {

        String dml = "DELETE FROM "  + todoTable + " WHERE id = ?" ;
        PreparedStatement pstmnt = conn.prepareStatement(dml);
        pstmnt.setInt( 1 , todo.getId());
        pstmnt.executeUpdate(); // returns delete count (0 for none)
        pstmnt.close();
    }
}


