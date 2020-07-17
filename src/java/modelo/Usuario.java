package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Usuario {

    private String correo, contrasena;
    private int idUsuario,nivel;

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getContrasena() {
        return contrasena;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }

    public int getNivel() {
        return nivel;
    }

    public void setNivel(int nivel) {
        this.nivel = nivel;
    }

    public Usuario() {
        
    }

    
    public boolean loguear() {
        final String SQL = "select * from participante where correo_electronico= ? and contrasena= ?";
        Conexion con = new Conexion();
        con.obtenerConexion();
        PreparedStatement pst=null;
        ResultSet rs=null;
        try {
            pst = con.getConnection().prepareStatement(SQL);
            pst.setString(1, getCorreo());
            pst.setString(2, getContrasena());
            rs = pst.executeQuery();
            if(rs.next()){
                setNivel(rs.getInt("nivel"));
                setIdUsuario(rs.getInt("id_participante"));
                return true;
            }
        } catch (Exception e) {
            System.err.println("Error" + e);
        }finally{
            try {
                if(con.obtenerConexion()!= null) con.obtenerConexion().close();
                if(pst != null) pst.close();
                if(rs!= null) rs.close();
            } catch (Exception e) {
                System.err.println("Error" + e);
            }
        }
        return false;
    }
        
}
