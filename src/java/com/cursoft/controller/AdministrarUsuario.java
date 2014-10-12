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
    
    public String iniciarSesion(UsuarioDto usuario){
        
        UsuarioDao user = new UsuarioDao();
                
        return user.validarInicioSesion(usuario);
    }
    
     public String eliminarUsuario(UsuarioDto usuario, byte estado){
        
         
        /*
         A tener en cuenta:
         
         -TIPOS de Usuario:
         1. Estudiante
         2. Docente
         3. Administrador
         
         -Estados para usuario:
         1. Activo
         0. Inactivo
         
         -Estados para aspirante:
         
         0. Pendiente (aquel que se encuentra registrado, en espera de aceptación)
         1. Aprobado (aquel que ya ha sido aprobado por el coordinador del curso)
         Cuando el coordinador aprueba al aspirante, se hace éste cambio de estado y
         se habilita la opción de carga del recibo de pago de matrícula del curso.
         2. Rechazado
         
         -Estados para estudiante:
         
         0. Pendiente (aquel que carga su recibo de pago de matrícula y se
         encuentra en espera que el coordinador le apruebe como estudiante)
         1. Aprobado (aquel que ya sido matriculado en el curso tras validar su recibo de
         matrícula)
         2. Graduado
         3. Rechazado
         
         -Tipos de docente:
         
         0. Administrador
         1. Profesor
         2. Coordinador
         3. 1 y 2
         4. 0 y 1
         5. 0 y 2
         6. 0, 1 y 2
         
         */
        UsuarioDao user = new UsuarioDao();
        
        try{
            return user.actualizarEstadoUsuario(usuario, estado);
        }catch(Exception ex){
            return "";
        }
        
    }
    
}
