
package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class Puntos {
    int idCodigo,idParticipante, puntos;

    public Puntos() {
    }

    public int getIdCodigo() {
        return idCodigo;
    }

    public void setIdCodigo(int idCodigo) {
        this.idCodigo = idCodigo;
    }

    public int getIdParticipante() {
        return idParticipante;
    }

    public void setIdParticipante(int idParticipante) {
        this.idParticipante = idParticipante;
    }

    public int getPuntos() {
        return puntos;
    }

    public void setPuntos(int puntos) {
        this.puntos = puntos;
    }
    
    public boolean addPuntos(){
        final String SQL = " Insert into registra(id_codigo,id_participante,puntos) values(?,?,?)";
        Conexion con = new Conexion();
        con.obtenerConexion();
        PreparedStatement pst=null;
        try {
            pst = con.getConnection().prepareStatement(SQL);
            pst.setInt(1,getIdCodigo());
            pst.setInt(2,getIdParticipante());
            pst.setInt(3, getPuntos());
            pst.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    public int mostrarPuntos(){
        int puntosTot=0;
        return puntosTot;
    }
}
