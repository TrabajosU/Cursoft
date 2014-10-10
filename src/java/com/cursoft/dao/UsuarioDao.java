/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cursoft.dao;
import com.cursoft.dto.UsuarioDto;
import com.cursoft.util.ConexionMysql;
import java.util.ArrayList;

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
    
    public boolean actualizarUsuario(UsuarioDto usuario) {
        System.out.println("llego a actualizar en usuario!!!!            ....");
        
        String sql = "UPDATE usuarios SET correo = '"+usuario.getCorreo()+"', contrasenia = '"+usuario.getContrasenia()+"', "+
                "nombre = '"+usuario.getNombre()+"', apellido = '"+usuario.getApellido()+"', idTipoDocumento = '"+usuario.getIdTipoDocumento()+"', "+
                "numeroDocumento = '"+usuario.getNumeroDocumento()+"', fechaNacimiento = '"+usuario.getFechaNacimiento()+"', "+
                "direccion = '"+usuario.getDireccion()+"', telefono = '"+usuario.getTelefono()+"', telefonoMovil = '"+usuario.getTelefonoMovil()+"' "+
                "WHERE codigo = '"+usuario.getCodigo()+"'";
        
        ConexionMysql.conectar();
        boolean x = ConexionMysql.ejecutarActualizacionSQL(sql);
        ConexionMysql.desconectar();
        return x;
    }
    
    /**
     * Método que cambia el estado de un usuario a inactivo.
     * @return 
     */
    public String actualizarEstadoUsuario(UsuarioDto usuario, byte estado){
        
        ConexionMysql.conectar();
                
        String consultaArmada = "";//hola
        
        String sql = "UPDATE usuarios SET estado = '" + estado + "' "
                        + "WHERE codigo = '" + usuario.getCodigo() + "';";                                                  
        
        ConexionMysql.ejecutarActualizacionSQL(sql);        
        
        
        ArrayList resultado = ConexionMysql.getConsultaSQL("SELECT usuarios.* FROM usuarios WHERE codigo = '" + usuario.getCodigo()+ "';");
           
        String [] registro = resultado.get(0).toString().split("-");
        
        consultaArmada += registro[1] + '-' + registro[4] + '-' + registro[5];
                                
        //consulta += resultado.toString();
        
        
        ConexionMysql.desconectar();
         
        return consultaArmada;
        
        
    }
    

    public boolean validarInicioSesion(UsuarioDto usuario, String tipo) {
        
        int tip = Integer.parseInt(tipo);
        String sql = "SELECT usuarios.nombre,usuarios.apellido FROM usuarios WHERE correo = '"+usuario.getCorreo()+
                "' AND contrasenia = '"+usuario.getContrasenia()+"' AND idTipoUsuario = '"+tip+"';";
        
        //boolean sw = false;
        ConexionMysql.conectar();
        //sw = true;
        
        
        ArrayList resultado = ConexionMysql.getConsultaSQL(sql);
        System.out.println(resultado.toString());
        
        boolean sw = false;
        if(resultado.size()!=0){
            usuario.setApellido(((String) resultado.get(0)).split("-")[1] );
            usuario.setNombre(((String) resultado.get(0)).split("-")[0] );
            sw= true;
        }
        
        ConexionMysql.desconectar();
        
        return sw;
    }

    
    
}
