package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import sun.security.jca.GetInstance;

/**
 *
 * @author ricar
 */
public class Codigo {
    private String codigo;
    int estado,id_codigo;

    public int getId_codigo() {
        return id_codigo;
    }

    public void setId_codigo(int id_codigo) {
        this.id_codigo = id_codigo;
    }

    public Codigo() {
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }
    public int validarFormato(){
        int r=0;
        if(getCodigo().length()==0){
            r=1;
            
        }else if(getCodigo().length()==9){
            r=5;
           
        }else if(getCodigo().length()>8){
            r=2;
           
        }else if(getCodigo().length()<8){
            r=3;
            
        }else {
            r=4;
            
        }
        return r;
    }
    public int obtenerPuntos(){
        int puntos=0;
        if(getCodigo().charAt(0)=='C'){
            puntos=20;
            
        }else if(getCodigo().charAt(0)=='M'){
            puntos=50;
           
        }else if(getCodigo().charAt(0)=='G'){
            puntos=100;
           
        }else if(getCodigo().charAt(0)=='E'){
            puntos=300;
            
        }
        return puntos;
    }
    
    public boolean existeCodigo(){
        final String SQL = "select * from codigo where codigo= ? and estado= ?";
        Conexion con = new Conexion();
        con.obtenerConexion();
        PreparedStatement pst=null;
        ResultSet rs=null;
        try {
            pst= con.getConnection().prepareStatement(SQL);
            pst.setString(1,getCodigo());
            pst.setInt(2, 1);
            rs =pst.executeQuery();
            if (rs.next()) {
                setId_codigo(rs.getInt("id_codigo"));
                return true;
            }
        } catch (Exception e) {
            System.err.println("Error" + e);
        }finally{
            try {
                if(pst != null) pst.close();
                if(rs!= null) rs.close();
            } catch (Exception e) {
                System.err.println("Error" + e);
            }
        }
        return false;
    }
    public boolean cambiarEstado(){
        final String SQL = "Update codigo set estado=? where codigo=? and estado=?";
        Conexion con = new Conexion();
        con.obtenerConexion();
        PreparedStatement pst=null;
        try {
            pst= con.getConnection().prepareStatement(SQL);
            pst.setInt(1,0);
            pst.setString(2, getCodigo());
            pst.setInt(3, 1);
            pst.executeUpdate();
            return true;
            
        } catch (Exception e) {
            System.err.println("Error" + e);
        }
        return false;
    }
   
}
