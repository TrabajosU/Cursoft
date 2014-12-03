/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cursoft.facade;

import com.cursoft.controller.AdministrarAspirante;
import com.cursoft.controller.AdministrarDocente;
import com.cursoft.controller.AdministrarEstudiante;
import com.cursoft.controller.AdministrarModulo;
import com.cursoft.controller.AdministrarUsuario;
import com.cursoft.dto.*;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.swing.JOptionPane;

/**
 *
 * @author Abdul
 */
public class Facade {

    public Facade() {

    }

    public int registrarAspirante(UsuarioDto usuario, AspiranteDto aspirante) {
        return new AdministrarAspirante().registrarAspirante(usuario, aspirante);
    }

    public String consultarEstudianteCodigo(String codigo) {
        return new AdministrarEstudiante().consultarEstudianteCodigo(codigo);
    }

    public String consultarEstudianteCorreo(String correo) {
        return new AdministrarEstudiante().consultarEstudianteCorreo(correo);
    }

    public int actualizarEstudiante(UsuarioDto usuario, AspiranteDto aspirante, EstudianteDto estudiante) {
        return new AdministrarEstudiante().actualizarEstudiante(usuario, aspirante, estudiante);
    }

    public int actualizarAspirante(UsuarioDto usuario, AspiranteDto aspirante) {
        return new AdministrarAspirante().actualizarAspirante(usuario, aspirante);
    }

    public String iniciarSesion(UsuarioDto usuario, String [] respuesta) {
        return new AdministrarUsuario().iniciarSesion(usuario, respuesta);
    }

    public String consultarAspirantes() {
        return new AdministrarAspirante().consultarAspirantes();
    }

    public String consultarEstudiantes() {
        return new AdministrarEstudiante().consultarEstudiantes();
    }

    public void actualizarAspiranteEstado(UsuarioDto usuario, AspiranteDto aspirante) {
        new AdministrarAspirante().actualizarAspiranteEstado(usuario, aspirante);
        return;
    }

    public void actualizarEstudianteEstado(UsuarioDto usuario, EstudianteDto estudiante) {
        new AdministrarEstudiante().actualizarEstudianteEstado(usuario, estudiante);
        return;
    }

    public String eliminarEstudiante(UsuarioDto usuario) {
        return new AdministrarUsuario().eliminarUsuario(usuario, (byte) 0);
    }

    public boolean registrarDocente(UsuarioDto usuario, DocenteDto docente) {
        return new AdministrarDocente().registrarDocente(usuario, docente);
    }

    public String consultarDocenteCorreo(String correo) {
        return new AdministrarDocente().consultarDocenteCorreo(correo);
    }

    public String consultarDocenteCodigo(String codigo) {
        return new AdministrarDocente().consultarDocenteCodigo(codigo);
    }

    public int actualizarDocente(UsuarioDto usuario, DocenteDto docente) {
        return new AdministrarDocente().actualizarDocente(usuario, docente);
    }

    public String consultarProfesores() {
        return new AdministrarDocente().consultarProfesores();
    }

    public String listarDocentes() {
        return new AdministrarDocente().listarDocentes();
    }

    public boolean registrarModulo(ModuloDto modulo, UsuarioDto usuario, String horario) {
        return new AdministrarModulo().registrarModulo(modulo, usuario, horario);
    }

    public String consultarAspiranteCorreo(String correo) {
        return new AdministrarAspirante().consultarAspiranteCorreo(correo);
    }

    public String consultarAspiranteCodigo(String codigo) {
        return new AdministrarAspirante().consultarAspiranteCodigo(codigo);
    }

    public String consultarModulo(ModuloDto modulo) {
        return new AdministrarModulo().consultarModulo(modulo);
    }

    public boolean actualizarModulo(ModuloDto modulo, UsuarioDto usuario, String horario) {
        return new AdministrarModulo().actualizarModulo(modulo, usuario, horario);
    }

    public boolean eliminarModulo(ModuloDto modulo) {
        return new AdministrarModulo().eliminarModulo(modulo);
    }

    public String listarModulos() {
        return new AdministrarModulo().listarModulos();
    }

    public String listarModulosProfesor(String cod) {
        return new AdministrarDocente().listarModulosProfesor(cod);
    }

    public String obtenerIdModulo(ModuloDto modulo) {
        return new AdministrarModulo().obtenerIdModulo(modulo);
    }

    public String obtenerIdEstudiante(String correo) {
        return new AdministrarEstudiante().obtenerIdEstudiante(correo);
    }

    public String obtenerIdAspirante(String correo) {
        return new AdministrarAspirante().obtenerIdAspirante(correo);
    }

    public boolean matricularModuloEstudiante(String idEstudiante, String idModuloDoc) {
        return new AdministrarModulo().matricularModuloEstudiante(idEstudiante, idModuloDoc);
    }

    /**
     * Método que permite listar los módulos que no han sido matriculados por un
     * estudiante determinado.
     *
     * @param idEstudiante
     * @return
     */
    public String listarModulosAMatricular(String idEstudiante) {
        return new AdministrarModulo().listarModulosAMatricular(idEstudiante);
    }

    public String listarModulosMatriculados(String idEstudiante) {
        return new AdministrarModulo().listarModulosMatriculados(idEstudiante);
    }

    public String listarEstudiantesModulo(String nombre) {
        return new AdministrarModulo().listarEstudiantesModulo(nombre);
    }

    public boolean cargarPagoMatricula(String idAspirante, String reciboPagoMatricula) {
        return new AdministrarEstudiante().registrarEstudiante(idAspirante, reciboPagoMatricula);
    }

    public void registrarNotasModulos(String listado, String nombreModulo) {
        new AdministrarModulo().registrarNotasModulos(listado, nombreModulo);
    }

    public String consultarUsuario(String correo) {
        return new AdministrarUsuario().consultarUsuario(correo);
    }

    public boolean enviarEmail(String correo, String mensaje) {

        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        Session session = Session.getInstance(props,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication("megateriosmt@gmail.com", "megaterios123");
                    }
                });

        try {

            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress("cursoft@ufps.edu.co"));
            message.setRecipients(Message.RecipientType.TO,
                    InternetAddress.parse(correo));
            message.setSubject("Recuperación de Contraseña");
            message.setText("Hola, éste es un mensaje de Cursoft. Tu contraseña es:\n\n" + mensaje);

            Transport.send(message);         
            return true;

        } catch (MessagingException e) {
            throw new RuntimeException(e);            
        }
    }
    
    public boolean esNumero(String valor){
        
        try{
            Integer.parseInt(valor);
            return true;
        }catch(NumberFormatException n){
            return false;
        }
                
    }
    
    public boolean esNumeroDecimal(String valor){
        
        try{
            Float.parseFloat(valor);
            return true;
        }catch(NumberFormatException n){
            return false;
        }
                
    }
}
