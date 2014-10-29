/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cursoft.dao;

import com.cursoft.dto.AspiranteDto;
import com.cursoft.dto.EstudianteDto;
import com.cursoft.dto.UsuarioDto;
import com.cursoft.util.ConexionMysql;
import java.util.ArrayList;

/**
 *
 * @author Megaterios
 */
public class EstudianteDao {

    public EstudianteDao() {
    }

    public boolean registrarEstudiante(UsuarioDto usuario, AspiranteDto aspirante, EstudianteDto estudiante) {

        ConexionMysql.conectar();

        ArrayList resultado = ConexionMysql.getConsultaSQL("SELECT usuarios.idUsuario FROM usuarios WHERE codigo='" + usuario.getCodigo() + "';");

        String idUsuario = ((String) resultado.get(0)).split("-")[0];

        resultado.clear();

        resultado = ConexionMysql.getConsultaSQL("SELECT aspirantes.idAspirante FROM aspirantes WHERE idUsuario='"
                + idUsuario + "';");

        String idAspirante = ((String) resultado.get(0)).split("-")[0];

        System.out.println(idAspirante);

        String sql = "INSERT INTO estudiantes(idAspirante, nota, estado) VALUES ('"
                + idAspirante + "','" + estudiante.getNota() + "','0')";

        ConexionMysql.ejecutarActualizacionSQL(sql);
        ConexionMysql.desconectar();
        return true;

    }

    public boolean actualizarEstudiante(UsuarioDto usuario, AspiranteDto aspirante, EstudianteDto estudiante) {

        ConexionMysql.conectar();

        ArrayList resultado = ConexionMysql.getConsultaSQL("SELECT usuarios.idUsuario FROM usuarios WHERE codigo='" + usuario.getCodigo() + "';");

        String idUsuario = ((String) resultado.get(0)).split("-")[0];

        resultado.clear();

        resultado = ConexionMysql.getConsultaSQL("SELECT aspirantes.idAspirante FROM aspirantes WHERE idUsuario='"
                + idUsuario + "';");

        String idAspirante = ((String) resultado.get(0)).split("-")[0];

        String sql = "UPDATE estudiantes SET nota = '" + estudiante.getNota() + "' WHERE idAspirante = '" + idAspirante + "'";

        ConexionMysql.ejecutarActualizacionSQL(sql);
        ConexionMysql.desconectar();
        return true;

    }

    public String consultarEstudianteCodigo(String codigo) {

        ConexionMysql.conectar();
        
        String consultaArmada = "";

        ArrayList resultado = ConexionMysql.getConsultaSQL("SELECT * FROM usuarios WHERE codigo = '" + codigo + "';");
        
        System.err.println(resultado.toString());

        try {
            String[] registro = resultado.get(0).toString().split("-");
            String idUsuario = registro[0];

            consultaArmada += registro[1] + "-" + registro[2] + "-" + registro[3] + "-"
                    + registro[4] + "-" + registro[5] + "-" + registro[6] + "-" + registro[7]
                    + "-" + registro[8] + "-" + registro[9] + "-" + registro[10] + "-"
                    + registro[11] + "-";

            resultado.clear();

            resultado = ConexionMysql.getConsultaSQL("SELECT * FROM aspirantes WHERE idUsuario='"
                    + idUsuario + "';");           

            registro = resultado.get(0).toString().split("-");
            
            String idAspirante = registro[0];
            consultaArmada += registro[2] + "-" + registro[3] + "-" + registro[4] + "-" +
                              registro[5] + "-" + registro[6] + "-";
            
            System.out.println("RESULTADO ASPIR: "+registro[2] + "-" + registro[3] + "-" + registro[4] + "-" +
                              registro[5] + "-" + registro[6] + "-");

            resultado.clear();

            resultado = ConexionMysql.getConsultaSQL("SELECT * FROM estudiantes WHERE idAspirante='"
                    + idAspirante + "';");

            System.out.println("bu: "+(String) resultado.get(0));
            registro = resultado.get(0).toString().split("-");
            consultaArmada += registro[1] + "-" + registro[5];
            
            ConexionMysql.desconectar();

            return consultaArmada;

        } catch (Exception e) {
            return "0";
        }

    }

    public String consultarEstudianteCorreo(String correo) {

        ConexionMysql.conectar();
        
        String consultaArmada = "";

        ArrayList resultado = ConexionMysql.getConsultaSQL("SELECT * FROM usuarios WHERE correo = '" + correo + "';");
        
        System.err.println(resultado.toString());
        
        try {
            String[] registro = resultado.get(0).toString().split("-");
            String idUsuario = registro[0];

            consultaArmada += registro[1] + "-" + registro[2] + "-" + registro[3] + "-"
                    + registro[4] + "-" + registro[5] + "-" + registro[6] + "-" + registro[7]
                    + "-" + registro[8] + "-" + registro[9] + "-" + registro[10] + "-"
                    + registro[11] + "-";

            resultado.clear();

            resultado = ConexionMysql.getConsultaSQL("SELECT * FROM aspirantes WHERE idUsuario='"
                    + idUsuario + "';");            

            registro = resultado.get(0).toString().split("-");
            
            String idAspirante = registro[0];
            consultaArmada += registro[2] + "-" + registro[3] + "-" + registro[4] + "-" +
                              registro[5] + "-" + registro[6] + "-";
            
            System.out.println("RESULTADO ASPIR: "+registro[2] + "-" + registro[3] + "-" + registro[4] + "-" +
                              registro[5] + "-" + registro[6] + "-");

            resultado.clear();

            resultado = ConexionMysql.getConsultaSQL("SELECT * FROM estudiantes WHERE idAspirante='"
                    + idAspirante + "';");            
            System.out.println("bu: "+(String) resultado.get(0));
            registro = resultado.get(0).toString().split("-");
            consultaArmada += registro[1] + "-" + registro[5];

            ConexionMysql.desconectar();

            return consultaArmada;
        } catch (Exception e) {
            return "0";
        }

    }

    public String consultarEstudiantes() {

        ConexionMysql.conectar();
        String sql1 = "SELECT usuarios.idUsuario,usuarios.codigo,usuarios.nombre,usuarios.apellido FROM usuarios ;";
        ArrayList resultado = ConexionMysql.getConsultaSQL(sql1);
        String consulta = "";
        if(!resultado.isEmpty()){
        System.out.println(resultado.toString());
        
        for (int i = 0; i < resultado.size(); i++) {

            String[] idUsuarios = resultado.get(i).toString().split("-");

            ArrayList resultado2 = ConexionMysql.getConsultaSQL("SELECT aspirantes.idAspirante FROM aspirantes WHERE idUsuario='"
                    + idUsuarios[0] + "';");
            if (!resultado2.isEmpty()) {
                System.out.println(resultado2.toString());

                ArrayList resultado3 = ConexionMysql.getConsultaSQL("SELECT estudiantes.estado FROM estudiantes WHERE idAspirante='"
                        + resultado2.get(0).toString().split("-")[0] + "';");
                
                if(!resultado3.isEmpty()){
                    consulta += idUsuarios[1] + "-" + idUsuarios[2] + "-" + idUsuarios[3] + "-" + resultado3.get(0).toString().split("-")[0] + ";";
                }
            }
        }
        }
        ConexionMysql.desconectar();
        return consulta;
    }

    public void actualizarEstudianteEstado(UsuarioDto usuario, EstudianteDto estudiante) {
        ConexionMysql.conectar();

        ArrayList resultado = ConexionMysql.getConsultaSQL("SELECT usuarios.idUsuario FROM usuarios WHERE codigo='" + usuario.getCodigo() + "';");

        String idUsuario = ((String) resultado.get(0)).split("-")[0];

        resultado.clear();

        resultado = ConexionMysql.getConsultaSQL("SELECT aspirantes.idAspirante FROM aspirantes WHERE idUsuario='"
                + idUsuario + "';");

        String idAspirante = ((String) resultado.get(0)).split("-")[0];

        int est = Integer.parseInt(estudiante.getEstado()) - 1;

        String sql = "UPDATE estudiantes SET estado = '" + est + "' WHERE idAspirante = '" + idAspirante + "'";

        boolean x = ConexionMysql.ejecutarActualizacionSQL(sql);
        ConexionMysql.desconectar();
        System.out.println("actualizo????::::::  " + x);
        return;
    }

}
