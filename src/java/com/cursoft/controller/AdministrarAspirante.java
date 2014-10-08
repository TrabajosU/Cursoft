/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cursoft.controller;
import com.cursoft.dao.AspiranteDao;
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
}
