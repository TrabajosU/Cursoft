/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cursoft.controller;

import com.cursoft.dao.AspiranteDao;
import com.cursoft.dao.UsuarioDao;
import com.cursoft.dto.AspiranteDto;
import com.cursoft.dto.UsuarioDto;

/**
 *
 * @author Manuel
 */
public class AdministrarAspirante {

    public AdministrarAspirante() {
        
    }

    public int registrarAspirante(UsuarioDto usuario, AspiranteDto aspirante) {

        UsuarioDao usuarioDao = new UsuarioDao();
        boolean us = usuarioDao.registrarUsuario(usuario);
        
        AspiranteDao aspiranteDao = new AspiranteDao();
        boolean as = aspiranteDao.registrarAspirante(usuario, aspirante);

        if (us && as) {
            return 1;
        }
        return 0;
    }

    public String consultarAspirantes() {

        AspiranteDao aspirante = new AspiranteDao();
        return aspirante.consultarAspirantes();
    }

    public void actualizarAspiranteEstado(UsuarioDto usuario, AspiranteDto aspirante) {

        AspiranteDao aspirant = new AspiranteDao();
        aspirant.actualizarAspiranteEstado(usuario, aspirante);
        return;
    }

    public String consultarAspiranteCorreo(String correo) {
        AspiranteDao aspirante = new AspiranteDao();
        return aspirante.consultarAspiranteCorreo(correo);
    }

    public String consultarAspiranteCodigo(String codigo) {
        AspiranteDao aspirante = new AspiranteDao();
        return aspirante.consultarAspiranteCodigo(codigo);
    }

}
