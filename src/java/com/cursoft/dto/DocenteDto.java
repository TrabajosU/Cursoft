/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cursoft.dto;

/**
 *
 * @author Manuel
 */
public class DocenteDto {

    private String escolaridad;
    private String escalafon;
    private String puntaje;
    private String tipo;
    private String contrato;
    
    public DocenteDto(){}

    public DocenteDto(String escolaridad, String escalafon, String puntaje, String tipo) {
        this.escolaridad = escolaridad;
        this.escalafon = escalafon;
        this.puntaje = puntaje;
        this.tipo = tipo;
    }

    public String getEscolaridad() {
        return escolaridad;
    }

    public void setEscolaridad(String escolaridad) {
        this.escolaridad = escolaridad;
    }

    public String getEscalafon() {
        return escalafon;
    }

    public void setEscalafon(String escalafon) {
        this.escalafon = escalafon;
    }

    public String getPuntaje() {
        return puntaje;
    }

    public void setPuntaje(String puntaje) {
        this.puntaje = puntaje;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getContrato() {
        return contrato;
    }

    public void setContrato(String contrato) {
        this.contrato = contrato;
    }
    
}
