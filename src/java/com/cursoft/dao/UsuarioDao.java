/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cursoft.dao;
import com.cursoft.dto.UsuarioDto;
import com.cursoft.util.ConexionMysql;

/**
 *
 * @author Abdul
 */
public class UsuarioDao {

    public UsuarioDao() {
    }
    
    public boolean registrarUsuario (UsuarioDto usuario) {
        
        String sql = "INSERT INTO usuarios(codigo, correo, contrasenia, nombre, apellido, idTipoDocumento, numeroDocumento, "
                + "fechaNacimiento, direccion, telefono, telefonoMovil, idTipoUsuario) VALUES ('" + usuario.getCodigo() + "','" 
                + usuario.getCorreo()+ "','" + usuario.getContrasenia() + "','" + usuario.getNombre() + "','"
                + usuario.getApellido() + "','" + usuario.getIdTipoDocumento() + "','" + usuario.getNumeroDocumento() + "','"
                + usuario.getFechaNacimiento() + "','"+ usuario.getDireccion() + "','" + usuario.getTelefono() + "','"
                + usuario.getTelefonoMovil() + "','" + usuario.getIdTipoUsuario() + "')";
        
        ConexionMysql.conectar();
        boolean x = ConexionMysql.ejecutarActualizacionSQL(sql);
        ConexionMysql.desconectar();
        return x;   
    }
    
}
