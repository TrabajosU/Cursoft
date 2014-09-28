/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.cursoft.util;
import java.sql.*;

/**
 * Clase que permite conectar con una Base De datos Mysql; sin embargo,
 * con solo cambiar el atributo controlador puede usarse para cualquier motor de base de datos
 * @author Marco Adarme
 * @version 2.0
 */
public class ConexionMysql {
    
    private static  String bd = "cursoft";
    private static  String login = "cursoft";
    private static  String password = "123456";
    private static  String host = "25.141.198.189";  
    private static  String url = "jdbc:mysql://" + host + ":3306/"+bd;
    private static  String controlador="com.mysql.jdbc.Driver";
    private static  JDBCMiddler jdbc;
    
    
    
    /**
     * Comprueba si hay o no hay conexion
     * @return un boolean, true si hay conexion y false si no
     */
    public static boolean hayConexion() {
        
        return (jdbc!=null && jdbc.hayconexion());
        
    }
    
    /**
     * Método que realiza la conexion con administrador de la base de datos
     */
    public static void conectar() {
        
        jdbc=new JDBCMiddler(controlador,url,login,password);
        
        try{
            
            jdbc.conectar();
            
        }catch(Exception e) {
            
            System.err.println(e.getMessage());
        }
    }
    
    /**
     * Método que ejecuta una actualizacion en una bae de datos
     * @param comandoSQL es de tipo Sting y contiene el comando SQL para ejecutar la actualizacion
     * @return un tipo boolean, true si ejecuta la actualiza y false sino.
     */
    public  static boolean ejecutarActualizacionSQL(String comandoSQL) {
        
        try {
            
            return (jdbc.ejecutarActualizacionSQL(comandoSQL));
            
        }catch(Exception e) {
            
            System.err.println("SQL Error:"+e.getMessage());
            return (false);
            
        }
        
    }
    
    /**
     * Método que desconecta la aplicacion de la base de datos
     */
    public  static void desconectar() {
        
        try{
            
            jdbc.desconectar();
            
        }catch(Exception e) {
            
            System.err.println("SQL Error:"+e.getMessage());
            
        }
        
    }
    
    /**
     * Método que retorna una consulta en formato de tabla HTML
     * @param sql contiene la consulta en sql
     * @return un Stirng con la informacion en formato de tabla HTML
     */
    public  static String getTablaHTML(String sql) {
        
        try{
            
            return (jdbc.getHTML(sql));
            
        }catch(Exception e) {
            
            System.err.println("SQL Error:"+e.getMessage());
            return ("No se pudo crear la tabla");
            
        }
        
    }
    
    /**
     * Método que ejecuta una instruccion SQL
     * @param consultaSQL es de tipo Stringy contiene la consulta en SQL
     * @return un tipo ResultSet que contiene la informacion sobre la consulta.
     */
    
    public  static ResultSet ejecutarSQL(String consultaSQL) {
        
        try{
            
            return (jdbc.ejecutarSQL(consultaSQL));
            
        }catch(Exception e) {
            
            System.err.println("SQL Error:"+e.getMessage());
            return (null);
            
        }
        
    }
    
    /**
     * Método que ejecuta una consulta en SQL
     * @param sql es de tipo String y contiene la consulta en sql
     * @return un tipo ArrayList y contiene la informacion que retorna la consulta
     */
    public static java.util.ArrayList<String>  getConsultaSQL(String sql) {
        
        try{
            
            return (jdbc.getSQL(sql));
            
        }catch(Exception e) {
            
            System.err.println("SQL Error:"+e.getMessage());
            return (null);
            
        }
        
    }

}//Fin de la Clase
