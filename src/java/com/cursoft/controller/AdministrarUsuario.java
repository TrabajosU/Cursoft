/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cursoft.controller;

import com.cursoft.dao.UsuarioDao;
import com.cursoft.dto.UsuarioDto;

/**
 *
 * @author Manuel
 */
public class AdministrarUsuario {
    
    public AdministrarUsuario(){}
    
    public boolean iniciarSesion(UsuarioDto usuario, String tipo){
        
        UsuarioDao user=new UsuarioDao();
        
        return user.validarInicioSesion(usuario, tipo);
    }
    
}
