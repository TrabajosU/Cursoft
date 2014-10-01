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
    
    public int registrarEstudiante(UsuarioDto usuario, AspiranteDto aspirante, EstudianteDto estudiante ) {
        
        UsuarioDao usuarioDao = new UsuarioDao();
        boolean us = usuarioDao.registrarUsuario(usuario);
        System.out.println("Usuario: "+usuario.toString());
        
        AspiranteDao aspiranteDao = new AspiranteDao();
        boolean as =  aspiranteDao.registrarAspirante(usuario, aspirante);
        
        EstudianteDao estudianteDao = new EstudianteDao();
        boolean es = estudianteDao.registrarEstudiante(usuario, aspirante, estudiante);
        
        if( us && as && es )
            return 1;
        return 0;
    }
    
}
