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

    public String consultarModulo(ModuloDto modulo) {
        String consulta="";
        ConexionMysql.conectar();
        
        ArrayList resultado = ConexionMysql.getConsultaSQL("SELECT modulos.idModulo, modulos.horas, modulos.tipo, modulos.fechaInicio FROM modulos WHERE nombre='"+modulo.getNombre()+"';");
        
        String [] mod = resultado.get(0).toString().split("-");
        String idModulo = mod[0];
        modulo.setHoras(mod[1]);
        modulo.setTipo(mod[2]);
        modulo.setFechaInicio(mod[3]);
        
        
        resultado.clear();
        
        resultado = ConexionMysql.getConsultaSQL("SELECT horarios.dia, horarios.horaInicio, horarios.horaFin, horarios.salon FROM horarios WHERE idModulo='"+idModulo+"';");
        
        for(int i=0; i<resultado.size();i++){
            consulta += resultado.get(i).toString() +";";
        }
        consulta += "::";
        
        resultado.clear();
        
        resultado = ConexionMysql.getConsultaSQL("SELECT docentesmodulos.idDocenteFK FROM docentesmodulos WHERE idModuloFK='"+idModulo+"';");
        
        String idDocente = resultado.get(0).toString().split("-")[0];
        
        resultado.clear();
        
        resultado = ConexionMysql.getConsultaSQL("SELECT docentes.idUsuarioDoc FROM docentes WHERE idDocente='"+idDocente+"';");
        
        String idUsuario = resultado.get(0).toString().split("-")[0];
        
        resultado.clear();
        
        resultado = ConexionMysql.getConsultaSQL("SELECT usuarios.codigo, usuarios.nombre, usuarios.apellido FROM usuarios WHERE idUsuario='"+idUsuario+"';");
        
        String codProfe = resultado.get(0).toString().split("-")[0];
        
        consulta += resultado.get(0).toString() + ";";
        
        resultado.clear();
        
        //   ¡Reutilizacion de Codigo!
        DocenteDao docente = new DocenteDao();
        String d = docente.consultarProfesores();
        String [] docentes = d.split(";");
        for(int i =0; i<docentes.length;i++){
            String doc[] = docentes[i].split("-");
            if(!doc[0].equals(codProfe)){
                consulta += doc[0]+"-"+doc[1]+"-"+doc[2]+";";
            }
        }
        ConexionMysql.desconectar();
        return consulta;
    }
    
}
