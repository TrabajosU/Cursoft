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

    public AdministrarModulo(){}
    
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

    
    
}
