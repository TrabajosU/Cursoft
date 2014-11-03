/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cursoft.controller;

import com.cursoft.dto.ModuloDto;
import com.cursoft.dto.UsuarioDto;
import com.cursoft.dao.ModuloDao;

/**
 *
 * @author Manuel
 */
public class AdministrarModulo {

    public AdministrarModulo(){
    
    }
    
    public boolean registrarModulo(ModuloDto modulo, UsuarioDto usuario, String horario) {
        ModuloDao mod = new ModuloDao();
        return mod.registrarModulo(modulo,usuario,horario);
    }

    public String consultarModulo(ModuloDto modulo) {
        ModuloDao mod = new ModuloDao();
        return mod.consultarModulo(modulo);
    }

    public boolean actualizarModulo(ModuloDto modulo, UsuarioDto usuario, String horario) {
        ModuloDao mod = new ModuloDao();
        return mod.actualizarModulo(modulo,usuario,horario);
    }

    public boolean eliminarModulo(ModuloDto modulo) {
        ModuloDao mod = new ModuloDao();
        return mod.eliminarModulo(modulo);
    }

    public String listarModulos() {
        ModuloDao mod = new ModuloDao();
        return mod.listarModulos();
    }

    public String obtenerIdModulo(ModuloDto modulo){
        ModuloDao mod = new ModuloDao();
        return mod.obtenerIdModulo(modulo);
    }

    public boolean matricularModuloEstudiante(String idEstudiante, String idModuloDoc) {
        return new ModuloDao().matricularModuloEstudiante(idEstudiante, idModuloDoc);
    }
    public String listarEstudiantesModulo(String nombre) {
        ModuloDao mod = new ModuloDao();
        return mod.listarEstudiantesModulo(nombre);
    }

    
    public String listarModulosAMatricular(String idEstudiante) {
        ModuloDao mod = new ModuloDao();
        return mod.listarModulosAMatricular(idEstudiante);
    }
    
    public String listarModulosMatriculados(String idEstudiante){
        ModuloDao mod = new ModuloDao();
        return mod.listarModulosMatriculados(idEstudiante);
    }

    public void registrarNotasModulos(String listado, String nombreModulo) {
        ModuloDao mod = new ModuloDao();
        mod.registrarNotasModulos(listado, nombreModulo);
    }
}
