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
                + "reporteFinalizacionMaterias, reportePazSalvo, reciboInscripcion) VALUES ('" + idUsuario + "','" + aspirante.getPromedioPonderado()
                + "','" + aspirante.getSemestreFinalizacionMaterias() + "','" + aspirante.getReporteFinalizacionMaterias() + "','"
                + aspirante.getReportePazSalvo() + "','" + aspirante.getReciboInscripcion() + "')";
        
        System.out.println(sql);
        
        ConexionMysql.ejecutarActualizacionSQL(sql);
        ConexionMysql.desconectar();
        
        return true;
    }
    
}
