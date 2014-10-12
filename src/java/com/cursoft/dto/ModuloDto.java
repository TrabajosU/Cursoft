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
public class ModuloDto {
    
    private String nombre;
    private String horas;
    private String tipo;
    private String fechaInicio;

    public ModuloDto() {
    }

    public ModuloDto(String nombre, String horas, String tipo, String fechaInicio) {
        this.nombre = nombre;
        this.horas = horas;
        this.tipo = tipo;
        this.fechaInicio = fechaInicio;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getHoras() {
        return horas;
    }

    public void setHoras(String horas) {
        this.horas = horas;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getFechaInicio() {
        return fechaInicio;
    }

    public void setFechaInicio(String fechaInicio) {
        this.fechaInicio = fechaInicio;
    }
    
    
    
}
