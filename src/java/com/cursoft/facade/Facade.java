/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cursoft.facade;
import com.cursoft.controller.AdministrarAspirante;
import com.cursoft.controller.AdministrarDocente;
import com.cursoft.controller.AdministrarEstudiante;
import com.cursoft.controller.AdministrarUsuario;
import com.cursoft.dto.*;

/**
 *
 * @author Abdul
 */
public class Facade {
    
    public int registrarEstudiante(UsuarioDto usuario, AspiranteDto aspirante, EstudianteDto estudiante ) {
        return new AdministrarEstudiante().registrarEstudiante(usuario, aspirante, estudiante);
    }
    
    public String consultarEstudianteCodigo(String codigo){
        return new AdministrarEstudiante().consultarEstudianteCodigo(codigo);
    }
    
    public int actualizarEstudiante(UsuarioDto usuario, AspiranteDto aspirante, EstudianteDto estudiante ) {
        return new AdministrarEstudiante().actualizarEstudiante(usuario, aspirante, estudiante);
    }
    
    public boolean iniciarSesion(UsuarioDto usuario,String tipo){
        return new AdministrarUsuario().iniciarSesion(usuario,tipo);
    }
    
    public String consultarAspirantes(){
        return new AdministrarAspirante().consultarAspirantes();
    }
    
    public String consultarEstudiantes(){
        return new AdministrarEstudiante().consultarEstudiantes();
    }
    
    public void actualizarAspiranteEstado(UsuarioDto usuario,AspiranteDto aspirante){
        new AdministrarAspirante().actualizarAspiranteEstado(usuario,aspirante);
        return;
    }
    
    public void actualizarEstudianteEstado(UsuarioDto usuario,EstudianteDto estudiante){
        new AdministrarEstudiante().actualizarEstudianteEstado(usuario,estudiante);
        return;
    }
    
    public String eliminarEstudiante(UsuarioDto usuario){
        return new AdministrarUsuario().eliminarUsuario(usuario, (byte)0);
    public boolean registrarDocente(UsuarioDto usuario, DocenteDto docente){
        return new AdministrarDocente().registrarDocente(usuario,docente);
    }
    
    public String consultarDocenteCodigo(String codigo){
        return new AdministrarDocente().consultarDocenteCodigo(codigo);
    }
    
    public int actualizarDocente(UsuarioDto usuario, DocenteDto docente){
        return new AdministrarDocente().actualizarDocente(usuario,docente);
    }
}
