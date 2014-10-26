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
        System.out.println("CÓDIGO: "+usuario.getCodigo());
        System.out.println(resultado.get(0).toString());
        
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
        System.out.println("el resultado es:     "+resultado.toString());
        String consulta = "";
        for(int i =0; i<resultado.size(); i++){
            System.out.println("i va de la sgte manera:  "+i);
            String [] idUsuarios = resultado.get(i).toString().split("-");
            
            ArrayList resultado2 = ConexionMysql.getConsultaSQL("SELECT aspirantes.estado FROM aspirantes WHERE idUsuario='" 
                    + idUsuarios[0] + "';");
            System.out.println("el resultado 2 es igual a:  "+resultado2.toString());
            if(!resultado2.isEmpty()){
                System.out.println(resultado2.toString());
                consulta += idUsuarios[1]+",,"+idUsuarios[2]+",,"+idUsuarios[3]+",,"+resultado2.get(0).toString().split("-")[0]+";";
                System.out.println("La consulta va de la siguiente manera:   "+consulta);
            }
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
    
    public String consultarAspiranteCorreo(String correo){
        
        ConexionMysql.conectar();
                
        String info ="";
        
        ArrayList resultado = ConexionMysql.getConsultaSQL("SELECT * FROM usuarios WHERE correo = '"+correo+"';");
        
        if(resultado.isEmpty()){
            return "";
        }
        String [] registro = resultado.get(0).toString().split("-");
        
        String idUsuario = registro[0];
        
        info += registro[1] + ",," + registro[2] + ",," + registro[3] + ",," + registro[4] + ",," +
                registro[5] + ",," + registro[6] + ",," + registro[7] + ",," + registro[8] + ",," +
                registro[9] + ",," + registro[10] + ",," + registro[11] + ",," + registro[12] + ",," +
                registro[13] + ",,";
                
        resultado.clear();
        
        resultado = ConexionMysql.getConsultaSQL("SELECT * FROM aspirantes WHERE idUsuario='" 
                + idUsuario + "';");                        
                
        if(resultado.isEmpty()){
            return "";
        }
        
        registro = resultado.get(0).toString().split("-");
        
        info += registro[2] + ",," + registro[3] + ",,";
        
        ConexionMysql.desconectar();
        
        return info;
    }
    
    public String consultarAspiranteCodigo(String codigo){
        
        ConexionMysql.conectar();
                
        String info ="";
        
        ArrayList resultado = ConexionMysql.getConsultaSQL("SELECT * FROM usuarios WHERE codigo = '" + codigo + "';");
        //consulta += resultado.toString();
        System.err.println(resultado.toString());
        if(resultado.isEmpty()){
            System.out.println("holavago");
            return "";
        }
        String [] registro = resultado.get(0).toString().split("-");
        
        String idUsuario = registro[0];
        
        info += registro[1] + ",," + registro[2] + ",," + registro[3] + ",," + registro[4] + ",," +
                registro[5] + ",," + registro[6] + ",," + registro[7] + ",," + registro[8] + ",," +
                registro[9] + ",," + registro[10] + ",," + registro[11] + ",," + registro[12] + ",," +
                registro[13] + ",,";
                
        resultado.clear();
        
        resultado = ConexionMysql.getConsultaSQL("SELECT * FROM aspirantes WHERE idUsuario='" 
                + idUsuario + "';");                        
                
        if(resultado.isEmpty()){
            return "";
        }
        
        registro = resultado.get(0).toString().split("-");
        
        info += registro[2] + ",," + registro[3] + ",,";
        
        ConexionMysql.desconectar();
        
        return info;
    }
    
    
}
