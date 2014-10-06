/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cursoft.facade;
import com.cursoft.controller.AdministrarEstudiante;
import com.cursoft.dto.*;

/**
 *
 * @author Abdul
 */
public class Facade {
    
    public int registrarEstudiante(UsuarioDto usuario, AspiranteDto aspirante, EstudianteDto estudiante ) {
        return new AdministrarEstudiante().registrarEstudiante(usuario, aspirante, estudiante);
    }
    
    public String realizarConsultaCodigo(String codigo){
        return new AdministrarEstudiante().realizarConsultaCodigo(codigo);
    }
}
