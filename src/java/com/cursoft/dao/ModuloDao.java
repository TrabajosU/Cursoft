/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cursoft.dao;

import com.cursoft.dto.ModuloDto;
import com.cursoft.dto.UsuarioDto;
import com.cursoft.util.ConexionMysql;
import java.util.ArrayList;

/**
 *
 * @author Manuel
 */
public class ModuloDao {
    
    public ModuloDao(){}

    public boolean registrarModulo(ModuloDto modulo, UsuarioDto usuario, String horario) {
        String sql = "INSERT INTO modulos(nombre, horas, tipo, fechaInicio) VALUES ('" + modulo.getNombre() + "','" 
                + modulo.getHoras()+ "','" + modulo.getTipo() + "','" + modulo.getFechaInicio() + "')";
        
        ConexionMysql.conectar();
        ConexionMysql.ejecutarActualizacionSQL(sql);
        ConexionMysql.desconectar();
        
        String horarios [] = horario.split(";");
        String idModulo = this.consultarIdModulo(modulo);
        for(int i=0;i<horarios.length;i++){
            String horas[] = horarios[i].split("-");
            System.out.println("El horario a insertar es: "+horas.toString());
            sql = "INSERT INTO horarios(idModulo, dia, horaInicio, horaFin, salon) VALUES ('"+idModulo+"','" + horas[0] + "','" 
                + horas[1]+ "','" + horas[2] + "','" + horas[3] + "')";
            System.out.println("El sql a insertar es: "+sql);
            ConexionMysql.conectar();
            ConexionMysql.ejecutarActualizacionSQL(sql);
            System.out.println("Inserto el horario "+i);
            ConexionMysql.desconectar();
        }
        
        String idDocente = this.consultarIdDocente(usuario.getCodigo());
        sql = "INSERT INTO docentesmodulos(idDocenteFK, idModuloFK, fecha) VALUES('"+idDocente+"','"+idModulo+"',"+"'1')";
        ConexionMysql.conectar();
        ConexionMysql.ejecutarActualizacionSQL(sql);
        ConexionMysql.desconectar();
        
        return true;
        
        
    }

    private String consultarIdModulo(ModuloDto modulo) {
        ConexionMysql.conectar();
        String sql1 = "SELECT modulos.idModulo FROM modulos WHERE nombre='" + modulo.getNombre()+ "' AND horas='"+modulo.getHoras()+
                "' AND tipo='"+modulo.getTipo()+"' AND fechaInicio='"+modulo.getFechaInicio()+"';";
        ArrayList resultado = ConexionMysql.getConsultaSQL(sql1);
        System.out.println(resultado.toString());
        
        String idModulo = ((String) resultado.get(0)).split("-")[0];
        ConexionMysql.desconectar();
        return idModulo;
    }

    private String consultarIdDocente(String codigo) {
        ConexionMysql.conectar();
        
        ArrayList resultado = ConexionMysql.getConsultaSQL("SELECT usuarios.idUsuario FROM usuarios WHERE codigo='" + codigo+ "';");
           
        String idUsuario = ((String) resultado.get(0)).split("-")[0];
        System.out.println("El idUsuario es: "+idUsuario);
        resultado.clear();
        
        resultado = ConexionMysql.getConsultaSQL("SELECT docentes.idDocente FROM docentes WHERE idUsuarioDoc='" 
                + idUsuario + "';");
        
        String idDocente = ((String) resultado.get(0)).split("-")[0];
        System.out.println("El idDocente es: "+idDocente);
        ConexionMysql.desconectar();
        return idDocente;
    }
    
}
