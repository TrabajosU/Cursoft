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
public class AspiranteDto {
    
    private int idAspirante;
    private int idUsuario;
    private String promedioPonderado;
    private String semestreFinalizacionMaterias;
    private String reporteFinalizacionMaterias;
    private String reportePazSalvo;
    private String reciboInscripcion;
    private String estado;

    public AspiranteDto() {
        
    }

    public AspiranteDto(int idAspirante, int idUsuario, String promedioPonderado, String semestreFinalizacionMaterias, String reporteFinalizacionMaterias, String reportePazSalvo, String reciboInscripcion, String estado) {
        this.idAspirante = idAspirante;
        this.idUsuario = idUsuario;
        this.promedioPonderado = promedioPonderado;
        this.semestreFinalizacionMaterias = semestreFinalizacionMaterias;
        this.reporteFinalizacionMaterias = reporteFinalizacionMaterias;
        this.reportePazSalvo = reportePazSalvo;
        this.reciboInscripcion = reciboInscripcion;
        this.estado = estado;
    }

    public int getIdAspirante() {
        return idAspirante;
    }

    public void setIdAspirante(int idAspirante) {
        this.idAspirante = idAspirante;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getPromedioPonderado() {
        return promedioPonderado;
    }

    public void setPromedioPonderado(String promedioPonderado) {
        this.promedioPonderado = promedioPonderado;
    }

    public String getSemestreFinalizacionMaterias() {
        return semestreFinalizacionMaterias;
    }

    public void setSemestreFinalizacionMaterias(String semestreFinalizacionMaterias) {
        this.semestreFinalizacionMaterias = semestreFinalizacionMaterias;
    }

    public String getReporteFinalizacionMaterias() {
        return reporteFinalizacionMaterias;
    }

    public void setReporteFinalizacionMaterias(String reporteFinalizacionMaterias) {
        this.reporteFinalizacionMaterias = reporteFinalizacionMaterias;
    }

    public String getReportePazSalvo() {
        return reportePazSalvo;
    }

    public void setReportePazSalvo(String reportePazSalvo) {
        this.reportePazSalvo = reportePazSalvo;
    }

    public String getReciboInscripcion() {
        return reciboInscripcion;
    }

    public void setReciboInscripcion(String reciboInscripcion) {
        this.reciboInscripcion = reciboInscripcion;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    @Override
    public String toString() {
        return "Aspirante{" + "idAspirante=" + idAspirante + ", idUsuario=" + idUsuario + ", promedioPonderado=" + promedioPonderado + ", semestreFinalizacionMaterias=" + semestreFinalizacionMaterias + ", reporteFinalizacionMaterias=" + reporteFinalizacionMaterias + ", reportePazSalvo=" + reportePazSalvo + ", reciboInscripcion=" + reciboInscripcion + ", estado=" + estado + '}';
    }
}
