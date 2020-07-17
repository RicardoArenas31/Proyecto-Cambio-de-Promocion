package modelo;

import java.sql.Connection;
import java.sql.DriverManager;

public class Conexion {
    
    private String url;
    private String user;
    private String passwd;
    private Connection connection;

    public Conexion() {
        url = "jdbc:postgresql://localhost:5432/siwcp";
        user = "postgres";
        passwd = "bd";
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getPasswd() {
        return passwd;
    }

    public void setPasswd(String passwd) {
        this.passwd = passwd;
    }

    public Connection getConnection() {
        return connection;
    }

    public void setConnection(Connection connection) {
        this.connection = connection;
    }
    
    public Connection obtenerConexion(){
        try {
            Class.forName("org.postgresql.Driver");
            return connection = DriverManager.getConnection(url,user,passwd);
        } catch (Exception e) {
        }
        return connection;
    }
   
   
}
