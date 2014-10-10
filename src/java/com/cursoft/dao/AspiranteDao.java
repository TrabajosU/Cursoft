/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cursoft.dao;

import com.cursoft.dto.AspiranteDto;
import com.cursoft.dto.UsuarioDto;
import com.cursoft.util.ConexionMysql;
import java.util.ArrayList;

/**
 *
 * @author Magaterios
 */
public class AspiranteDao {
    
    public boolean registrarAspirante (UsuarioDto usuario, AspiranteDto aspirante) {
        
        ConexionMysql.conectar();
        String sql1 = "SELECT usuarios.idUsuario FROM usuarios WHERE codigo='" + usuario.getCodigo()+ "';";
        ArrayList resultado = ConexionMysql.getConsultaSQL(sql1);
        System.out.println(resultado.toString());
        
        String idUsuario = ((String) resultado.get(0)).split("-")[0];
        
        String sql = "INSERT INTO aspirantes (idUsuario, promedioPonderado, semestreFinalizacionMaterias, "
                + "reporteFinalizacionMaterias, reportePazSalvo, reciboInscripcion, estado) VALUES ('" + idUsuario + "','" + aspirante.getPromedioPonderado()
                + "','" + aspirante.getSemestreFinalizacionMaterias() + "','" + aspirante.getReporteFinalizacionMaterias() + "','"
                + aspirante.getReportePazSalvo() + "','" + aspirante.getReciboInscripcion() + "','0'" + ")";
        
        System.out.println(sql);
        
        ConexionMysql.ejecutarActualizacionSQL(sql);
        ConexionMysql.desconectar();
        
        return true;
    }

    public boolean actualizarAspirante(UsuarioDto usuario, AspiranteDto aspirante) {
        System.out.println(" codigo :  "+usuario.getCodigo());
        ConexionMysql.conectar();
        String sql1 = "SELECT usuarios.idUsuario FROM usuarios WHERE codigo='" + usuario.getCodigo()+ "';";
        ArrayList resultado = ConexionMysql.getConsultaSQL(sql1);
        System.out.println(resultado.toString());
        
        String idUsuario = ((String) resultado.get(0)).split("-")[0];
        
        String sql = "UPDATE aspirantes SET promedioPonderado = '"+aspirante.getPromedioPonderado()+"', semestreFinalizacionMaterias = '"+aspirante.getSemestreFinalizacionMaterias()+"', "+
                "reporteFinalizacionMaterias = '"+aspirante.getReporteFinalizacionMaterias()+"', reportePazSalvo = '"+aspirante.getReportePazSalvo()+
                "', reciboInscripcion = '"+aspirante.getReciboInscripcion()+"' WHERE idUsuario = '"+idUsuario+"'";
        
        
        boolean x = ConexionMysql.ejecutarActualizacionSQL(sql);
        ConexionMysql.desconectar();
        return x;
    }

    public String consultarAspirantes() {
        
        ConexionMysql.conectar();
        String sql1 = "SELECT usuarios.idUsuario, usuarios.codigo, usuarios.nombre, usuarios.apellido FROM usuarios;";
        ArrayList resultado = ConexionMysql.getConsultaSQL(sql1);
        System.out.println(resultado.toString());
        String consulta = "";
        for(int i =0; i<resultado.size(); i++){
            String [] idUsuarios = resultado.get(i).toString().split("-");
            
            ArrayList resultado2 = ConexionMysql.getConsultaSQL("SELECT aspirantes.estado FROM aspirantes WHERE idUsuario='" 
                    + idUsuarios[0] + "';");
            System.out.println(resultado2.toString());
            consulta += idUsuarios[1]+"-"+idUsuarios[2]+"-"+idUsuarios[3]+"-"+resultado2.get(0).toString().split("-")[0]+";";
        }
        ConexionMysql.desconectar();
        return consulta;
    }

    public void actualizarAspiranteEstado(UsuarioDto usuario, AspiranteDto aspirante) {
        System.out.println(" actualizarAspiranteEstado con codigo :  "+usuario.getCodigo()+"y estado:   "+aspirante.getEstado());
        ConexionMysql.conectar();
        String sql1 = "SELECT usuarios.idUsuario FROM usuarios WHERE codigo='" + usuario.getCodigo()+ "';";
        ArrayList resultado = ConexionMysql.getConsultaSQL(sql1);
        System.out.println(resultado.toString());
        
        String idUsuario = ((String) resultado.get(0)).split("-")[0];
        int estad = Integer.parseInt(aspirante.getEstado())-1;
        String sql = "UPDATE aspirantes SET estado = '"+estad+"' WHERE idUsuario = '"+idUsuario+"'";
        
        
        boolean x = ConexionMysql.ejecutarActualizacionSQL(sql);
        ConexionMysql.desconectar();
        System.out.println("actualizo estado ???? : "+x);
        return;
        
    }
    
    
    
}
