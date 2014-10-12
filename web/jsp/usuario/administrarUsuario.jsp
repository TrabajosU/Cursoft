<%-- 
    Document   : administrarUsuario
    Created on : 6/10/2014, 07:59:15 PM
    Author     : Manuel
--%>

<%@page import="com.cursoft.dto.UsuarioDto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session='true'%>
<jsp:useBean id="facade" class="com.cursoft.facade.Facade"></jsp:useBean>
<jsp:useBean id="usuario" class="com.cursoft.dto.UsuarioDto"></jsp:useBean>


<%
    // <a class="btn btn-danger" role="button" href="index.php?mostrar=IU_REGISTRAR_ASPIRANTE">Registrar - Aspirante</a>
    // <button class="btn btn-danger" id="registrar" name = "requerimiento" value="registrarAspirante" type="submit">Registrar - Aspirante</button>
    String boton = (String)request.getParameter("requerimiento");
    //out.print(boton);
    if(boton.equals("iniciarSesion")){
        
        byte tipo = Byte.parseByte(request.getParameter("tipo"));
        String correo = request.getParameter("correo");
        String contrasenia = request.getParameter("contrasenia");
    
        usuario.setIdTipoUsuario(tipo);
        usuario.setCorreo(correo);
        usuario.setContrasenia(contrasenia);
            
        String resp = facade.iniciarSesion(usuario);
        
        if(resp.equals("A0")){
            out.print("Bienvenido, eres un aspirante pendiente");
        }
        else if(resp.equals("A1")){
            out.print("Bienvenido, eres un aspirante aprobado, puedes cargar tu matrícula");
        }            
        else if(resp.equals("E0")){
            out.print("Bienvenido, eres un estudiante pendiente");
        }
        else if(resp.equals("E1")){
            out.print("Bienvenido, eres un estudiante aprobado, ya estás matriculado");
        }
        else if(resp.equals("E2")){
            out.print("Bienvenido, eres un estudiante egresado");
        }
        else if(resp.equals("D0")){
            out.print("Bienvenido, eres el administrador");
        }
        else if(resp.equals("D1")){
            out.print("Bienvenido, eres un profesor");
        }
        else if(resp.equals("D2")){
            out.print("Bienvenido, eres un estudiante coordinador");
        }
        else if(resp.equals("D3")){
            out.print("Bienvenido, eres un profesor-coordinador");
        }
        else if(resp.equals("D4")){
            out.print("Bienvenido, eres un administrador-profesor");
        }
        else if(resp.equals("D5")){
            out.print("Bienvenido, eres un administrador-coordinador");
        }
        else if(resp.equals("D6")){
            out.print("Bienvenido, eres un docente con de todos los tipos");
        }
        else if(resp.equals("-1")){
            out.print("Datos incorrectos, verifica tu usuario y contraseña");
            session.setAttribute("Mensaje", "Tu cuenta se encuentra inactiva");
            response.sendRedirect("estudiante.jsp");
        }
        else if(resp.equals("-2")){
            //out.print("Tu cuenta se encuentra inactiva");
            session.setAttribute("Mensaje", "Tu cuenta se encuentra inactiva");
            response.sendRedirect("estudiante.jsp");
        }
        
        HttpSession ssn = request.getSession(true);
        ssn.setAttribute("usuario", usuario);
        
        
        /*
        if(resp){
            //session.setAttribute("nombre",usuario.getNombre());
            //session.setAttribute("apellido", usuario.getApellido());
            response.sendRedirect("administrarCoordinador.jsp");
            //out.println("Conecto");
        }
        else{
            response.sendRedirect("inicioSesion.jsp");
            //out.println("No Conecto");
        }
        */
    }
    else if(boton.equals("registrarAspirante")){
        response.sendRedirect("../estudiante/estudiante.jsp");
    }
    
    
%>
