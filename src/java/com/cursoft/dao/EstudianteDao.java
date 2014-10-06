/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cursoft.dao;

import com.cursoft.dto.AspiranteDto;
import com.cursoft.dto.EstudianteDto;
import com.cursoft.dto.UsuarioDto;
import com.cursoft.util.ConexionMysql;
import java.util.ArrayList;

/**
 *
 * @author Megaterios
 */
public class EstudianteDao {

    public EstudianteDao() {
    }
    
    public boolean registrarEstudiante(UsuarioDto usuario, AspiranteDto aspirante, EstudianteDto estudiante) {
        
        ConexionMysql.conectar();
        
        ArrayList resultado = ConexionMysql.getConsultaSQL("SELECT usuarios.idUsuario FROM usuarios WHERE codigo='" + usuario.getCodigo()+ "';");
           
        String idUsuario = ((String) resultado.get(0)).split("-")[0];
        
        resultado.clear();
        
        resultado = ConexionMysql.getConsultaSQL("SELECT aspirantes.idAspirante FROM aspirantes WHERE idUsuario='" 
                + idUsuario + "';");
        
        String idAspirante = ((String) resultado.get(0)).split("-")[0];
        
        System.out.println(idAspirante);
        
        String sql = "INSERT INTO estudiantes(idAspirante, nota) VALUES ('"
                +  idAspirante + "','" + estudiante.getNota()+ "')";
        
        ConexionMysql.ejecutarActualizacionSQL(sql);
        ConexionMysql.desconectar();
        return true;
        
    }

    public String realizarConsultaCodigo(String codigo) {
       
        ConexionMysql.conectar();
        
        String consulta = "";
        String consultaArmada ="";
        
        ArrayList resultado = ConexionMysql.getConsultaSQL("SELECT * FROM usuarios WHERE codigo = '"+codigo+"';");
        //consulta += resultado.toString();
        System.err.println(resultado.toString());
        
        String idUsuario = ((String) resultado.get(0)).split("-")[0];
        
        consultaArmada += ((String) resultado.get(0)).split("-")[1] + "-" + ((String) resultado.get(0)).split("-")[2] + "-" +
                ((String) resultado.get(0)).split("-")[3] + "-" + ((String) resultado.get(0)).split("-")[4] + "-" +
                ((String) resultado.get(0)).split("-")[5] + "-" + ((String) resultado.get(0)).split("-")[6] + "-" +
                ((String) resultado.get(0)).split("-")[7] + "-" + ((String) resultado.get(0)).split("-")[8] + "-" +
                ((String) resultado.get(0)).split("-")[9] + "-" + ((String) resultado.get(0)).split("-")[10] + "-" +
                ((String) resultado.get(0)).split("-")[11] + "-";
        
        resultado.clear();
        
        resultado = ConexionMysql.getConsultaSQL("SELECT * FROM aspirantes WHERE idUsuario='" 
                + idUsuario + "';");
        //consulta += resultado.toString();
        
        String idAspirante = ((String) resultado.get(0)).split("-")[0];
        
        consultaArmada += ((String) resultado.get(0)).split("-")[2] + "-" +((String) resultado.get(0)).split("-")[3] + "-";
        
        resultado.clear();
        
        resultado = ConexionMysql.getConsultaSQL("SELECT * FROM estudiantes WHERE idAspirante='" 
                + idAspirante + "';");
        //consulta += resultado.toString();
        
        consultaArmada += ((String) resultado.get(0)).split("-")[4];
        
        ConexionMysql.desconectar();
        
        return consultaArmada;
        
    }
    
}
