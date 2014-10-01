/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cursoft.dto;

/**
 *
 * @author Abdul
 */
public class EstudianteDto {
    
    private int idEstudiante;
    private int idAspirante;
    private int idSemestre;
    private int idProyecto;
    private int nota;
    private String reciboPagoMatricula;
    private String estado;
    

    public EstudianteDto() {
    }

    public EstudianteDto(int idEstudiante, int idAspirante, int idSemestre, int idProyecto, int nota, String reciboPagoMatricula, String estado) {
        this.idEstudiante = idEstudiante;
        this.idAspirante = idAspirante;
        this.idSemestre = idSemestre;
        this.idProyecto = idProyecto;
        this.nota = nota;
        this.reciboPagoMatricula = reciboPagoMatricula;
        this.estado = estado;
    }

    public int getIdEstudiante() {
        return idEstudiante;
    }

    public void setIdEstudiante(int idEstudiante) {
        this.idEstudiante = idEstudiante;
    }

    public int getIdAspirante() {
        return idAspirante;
    }

    public void setIdAspirante(int idAspirante) {
        this.idAspirante = idAspirante;
    }

    public int getIdSemestre() {
        return idSemestre;
    }

    public void setIdSemestre(int idSemestre) {
        this.idSemestre = idSemestre;
    }

    public int getIdProyecto() {
        return idProyecto;
    }

    public void setIdProyecto(int idProyecto) {
        this.idProyecto = idProyecto;
    }

    public int getNota() {
        return nota;
    }

    public void setNota(int nota) {
        this.nota = nota;
    }

    public String getReciboPagoMatricula() {
        return reciboPagoMatricula;
    }

    public void setReciboPagoMatricula(String reciboPagoMatricula) {
        this.reciboPagoMatricula = reciboPagoMatricula;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    @Override
    public String toString() {
        return "Estudiante{" + "idEstudiante=" + idEstudiante + ", idAspirante=" + idAspirante + ", idSemestre=" + idSemestre + ", idProyecto=" + idProyecto + ", nota=" + nota + ", estado=" + estado + '}';
    }
    
}
