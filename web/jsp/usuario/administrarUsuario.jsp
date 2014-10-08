<%-- 
    Document   : administrarUsuario
    Created on : 6/10/2014, 07:59:15 PM
    Author     : Manuel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="facade" class="com.cursoft.facade.Facade"></jsp:useBean>
<jsp:useBean id="usuario" class="com.cursoft.dto.UsuarioDto"></jsp:useBean>

<%
    // <a class="btn btn-danger" role="button" href="index.php?mostrar=IU_REGISTRAR_ASPIRANTE">Registrar - Aspirante</a>
    // <button class="btn btn-danger" id="registrar" name = "requerimiento" value="registrarAspirante" type="submit">Registrar - Aspirante</button>
    String boton = (String)request.getParameter("requerimiento");
    //out.print(boton);
    if(boton.equals("iniciarSesion")){
        
        String tipo = request.getParameter("tipo");
        String correo = request.getParameter("correo");
        String contrasenia = request.getParameter("contrasenia");
    
        usuario.setCorreo(correo);
        usuario.setContrasenia(contrasenia);
    
        
        boolean bandera = facade.iniciarSesion(usuario,tipo);
    
        if(bandera){
            //session.setAttribute("nombre",usuario.getNombre());
            //session.setAttribute("apellido", usuario.getApellido());
            response.sendRedirect("administrarCoordinador.jsp");
            //out.println("Conecto");
        }
        else{
            response.sendRedirect("inicioSesion.jsp");
            //out.println("No Conecto");
        }
    }
    else if(boton.equals("registrarAspirante")){
        response.sendRedirect("../estudiante/estudiante.jsp");
    }
    
    
%>
