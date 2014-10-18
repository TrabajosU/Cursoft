/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cursoft.controller;
import com.cursoft.dao.AspiranteDao;
import com.cursoft.dto.AspiranteDto;
import com.cursoft.dto.EstudianteDto;
import com.cursoft.dto.UsuarioDto;
/**
 *
 * @author Manuel
 */
public class AdministrarAspirante {
    
    public AdministrarAspirante(){}
    
    public String consultarAspirantes(){
        
        AspiranteDao aspirante = new AspiranteDao();
        return aspirante.consultarAspirantes();
    }

    public void actualizarAspiranteEstado(UsuarioDto usuario, AspiranteDto aspirante) {
        
        AspiranteDao aspirant = new AspiranteDao();
        aspirant.actualizarAspiranteEstado(usuario, aspirante);
        return;
    }
    
    public String consultarAspiranteCorreo(String correo){
        AspiranteDao aspirante = new AspiranteDao();
        return aspirante.consultarAspiranteCorreo(correo);
    }
    
    public String consultarAspiranteCodigo(String codigo){
        AspiranteDao aspirante = new AspiranteDao();
        return aspirante.consultarAspiranteCodigo(codigo);
    }

}
