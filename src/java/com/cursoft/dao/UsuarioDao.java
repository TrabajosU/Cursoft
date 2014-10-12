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
        
        System.out.println("datosss: "+usuario.toString());
        String sql = "INSERT INTO usuarios(codigo, correo, contrasenia, nombre, apellido, idTipoDocumento, numeroDocumento, "
                + "fechaNacimiento, direccion, telefono, telefonoMovil, idTipoUsuario, estado) VALUES ('" + usuario.getCodigo() + "','" 
                + usuario.getCorreo()+ "','" + usuario.getContrasenia() + "','" + usuario.getNombre() + "','"
                + usuario.getApellido() + "','" + usuario.getIdTipoDocumento() + "','" + usuario.getNumeroDocumento() + "','"
                + usuario.getFechaNacimiento() + "','"+ usuario.getDireccion() + "','" + usuario.getTelefono() + "','"
                + usuario.getTelefonoMovil() + "','" + usuario.getIdTipoUsuario() + "', '1')";
        
        ConexionMysql.conectar();
        boolean x = ConexionMysql.ejecutarActualizacionSQL(sql);
        System.out.println("ingresó a tabla usuario el dato?: "+x);
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
    
    public String validarInicioSesion(UsuarioDto usuario){
        
        ConexionMysql.conectar();
        
        String consulta = "";
        String info ="";
        
        ArrayList resultado = ConexionMysql.getConsultaSQL("SELECT * FROM usuarios WHERE correo = '" + usuario.getCorreo() + "';");
        //consulta += resultado.toString();
        System.err.println(resultado.toString());
        
        if(resultado.isEmpty()){
            return "-1";
        }
        String [] registro = resultado.get(0).toString().split("-");
        
        if(!String.valueOf(usuario.getIdTipoUsuario()).equals(registro[12]) ||
            !registro[3].equals(usuario.getContrasenia())){
            return "-1"; //Datos incorrectos
        }
        if(registro[13].equals("0")){
            return "-2";
        }
        String idUsuario = registro[0];
        
        resultado.clear();
        
        if(usuario.getIdTipoUsuario() == 1){
            //busco en aspirante y estudiante
            resultado = ConexionMysql.getConsultaSQL("SELECT aspirantes.idAspirante, "
                        + "aspirantes.estado FROM aspirantes WHERE idUsuario = '" + idUsuario + "';");
            if(!resultado.isEmpty()){
                registro = resultado.get(0).toString().split("-");
                if(registro[1].equals("0")){
                    return "A0";
                }
                else{
                    String idAspirante = registro[0];
                    resultado.clear();
                    resultado = ConexionMysql.getConsultaSQL("SELECT estudiantes.estado, "
                        + " FROM estudiantes WHERE idAspirante = '" + idAspirante + "';");
                    if(!resultado.isEmpty()){
                        registro = resultado.get(0).toString().split("-");
                        return ("E" + registro[0]);                        
                    }
                    return "A1";
                    
                }
            }            
        }
        else if(usuario.getIdTipoUsuario() == 2 || usuario.getIdTipoUsuario() == 3){
            //busco en docente
            resultado = ConexionMysql.getConsultaSQL("SELECT docentes.estado, "
                        + " FROM docentes WHERE idUsuario = '" + idUsuario + "';");
            if(!resultado.isEmpty()){
                registro = resultado.get(0).toString().split("-");
                return ("D" + registro[0]);
            }           
        }        
                                                
        //info += registro[1] + '-' + registro[4] + '-' + registro[5];
        ConexionMysql.desconectar();
        
        return "-1";
    }
    
    
    /**
     * Método que cambia el estado de un usuario a inactivo.
     * @return 
     */
    public String actualizarEstadoUsuario(UsuarioDto usuario, byte estado){
        
        ConexionMysql.conectar();
                
        String consultaArmada = "";  //hola
        
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
