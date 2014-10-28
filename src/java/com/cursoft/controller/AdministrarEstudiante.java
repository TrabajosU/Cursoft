/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cursoft.controller;

import com.cursoft.dto.*;
import com.cursoft.dao.*;

/**
 *
 * @author Megaterios
 */
public class AdministrarEstudiante {

    public AdministrarEstudiante() {
    }
        

    public String consultarEstudianteCodigo(String codigo) {
        
        if(codigo.isEmpty())
            return "";
        
        //Niño Bueno
        
        //UsuarioDao usuarioDao = new UsuarioDao();
        //String consulta = usuarioDao.realizarConsultaCodigo(codigo);
        
        //AspiranteDao aspiranteDao = new AspiranteDao();
        //consulta += "-" + aspiranteDao.realizarConsultaCodigo(codigo);
        
        //Fin niño bueno
        
        EstudianteDao estudianteDao = new EstudianteDao();
        String consulta = estudianteDao.consultarEstudianteCodigo(codigo);
        
        
        
        /*
        Mirar la base de datos y separar las variables que van a llegar a los campos correspondientes
        Quitar los ID'S...
        Mirar como muestro solo esa informacion
        */
        
        return consulta;
    }

    public String consultarEstudianteCorreo(String correo) {
        
        if(correo.isEmpty())
            return "";
        
        //Niño Bueno
        
        //UsuarioDao usuarioDao = new UsuarioDao();
        //String consulta = usuarioDao.realizarConsultaCodigo(codigo);
        
        //AspiranteDao aspiranteDao = new AspiranteDao();
        //consulta += "-" + aspiranteDao.realizarConsultaCodigo(codigo);
        
        //Fin niño bueno
        
        EstudianteDao estudianteDao = new EstudianteDao();
        String consulta = estudianteDao.consultarEstudianteCorreo(correo);
        
        
        
        /*
        Mirar la base de datos y separar las variables que van a llegar a los campos correspondientes
        Quitar los ID'S...
        Mirar como muestro solo esa informacion
        */
        
        return consulta;
    }
    
    public int actualizarEstudiante(UsuarioDto usuario, AspiranteDto aspirante, EstudianteDto estudiante) {
        
        UsuarioDao usuarioDao = new UsuarioDao();
        boolean us = usuarioDao.actualizarUsuario(usuario);        
        
        AspiranteDao aspiranteDao = new AspiranteDao();
        boolean as =  aspiranteDao.actualizarAspirante(usuario, aspirante);
        
        EstudianteDao estudianteDao = new EstudianteDao();
        boolean es = estudianteDao.actualizarEstudiante(usuario, aspirante, estudiante);
        
        if( us || as || es )
            return 1;
        return 0;
    }
    
    public String consultarEstudiantes(){
        
        EstudianteDao estudiante = new EstudianteDao();
        return estudiante.consultarEstudiantes();
    }

    public void actualizarEstudianteEstado(UsuarioDto usuario, EstudianteDto estudiante) {
        EstudianteDao student = new EstudianteDao();
        student.actualizarEstudianteEstado(usuario,estudiante);
        return;
    }

    public String obtenerIdEstudiante(String correo) {
        return new EstudianteDao().obtenerIdEstudiante(correo);
    }
    
}
