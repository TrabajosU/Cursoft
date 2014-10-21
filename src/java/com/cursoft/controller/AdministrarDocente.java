/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cursoft.controller;

import com.cursoft.dto.DocenteDto;
import com.cursoft.dto.UsuarioDto;
import com.cursoft.dao.*;

/**
 *
 * @author Manuel
 */
public class AdministrarDocente {

    public AdministrarDocente(){}
    
    public boolean registrarDocente(UsuarioDto usuario, DocenteDto docente) {
        UsuarioDao user = new UsuarioDao();
        boolean x = user.registrarUsuario(usuario);
        DocenteDao doc = new DocenteDao();
        boolean w = doc.registrarDocente(usuario,docente);
        if(x&&w)
            return true;
        return false;
    }

    public String consultarDocenteCodigo(String codigo) {
        DocenteDao doc = new DocenteDao();
        String consulta = doc.consultarDocenteCodigo(codigo);
        return consulta;
    }

    public int actualizarDocente(UsuarioDto usuario, DocenteDto docente) {
        UsuarioDao usuarioDao = new UsuarioDao();
        boolean us = usuarioDao.actualizarUsuario(usuario);
        
        DocenteDao doc = new DocenteDao();
        boolean dc = doc.actualizarDocente(usuario,docente);
        
        if(us&&dc)
            return 1;
        return 0;
    }

    public String consultarProfesores() {
        DocenteDao doc = new DocenteDao();
        String consulta = doc.consultarProfesores();
        return consulta;
    }

    public String listarDocentes() {
        DocenteDao doc = new DocenteDao();
        String lista = doc.listarDocentes();
        return lista;
    }

    public String listarModulosProfesor(String cod) {
        DocenteDao doc = new DocenteDao();
        String lista = doc.listarModulosProfesor(cod);
        return lista;
    }
    
}
