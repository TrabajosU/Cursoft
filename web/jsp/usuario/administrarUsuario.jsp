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
    String boton = (String) request.getParameter("requerimiento");
    HttpSession sesionUsuario = null;

    if (boton.equals("iniciarSesion")) {

        String error = "";

        byte tipo = Byte.parseByte(request.getParameter("tipo"));
        String correo = request.getParameter("correo");
        String contrasenia = request.getParameter("contrasenia");

        usuario.setIdTipoUsuario(tipo);
        usuario.setCorreo(correo);
        usuario.setContrasenia(contrasenia);

        String [] respuesta = new String[1];
        String resp = facade.iniciarSesion(usuario, respuesta);

        if (resp.equals("A0")) {
            //out.print("Bienvenido, eres un aspirante pendiente");
            System.out.println("holita " + resp);
            sesionUsuario = request.getSession(true);
            sesionUsuario.setAttribute("usuario", correo);
            sesionUsuario.setAttribute("estadoUsuario", resp);

            response.sendRedirect("../aspirante/administrarAspirante.jsp?requerimiento=mostrarInicio");
        } else if (resp.equals("A1")) {
            System.out.println("holita2 " + resp);
            //out.print("Bienvenido, eres un aspirante aprobado, puedes cargar tu matrícula");
            sesionUsuario = request.getSession(true);
            sesionUsuario.setAttribute("usuario", correo);
            sesionUsuario.setAttribute("estadoUsuario", resp);
            response.sendRedirect("../aspirante/administrarAspirante.jsp?requerimiento=mostrarInicio");
        } else if (resp.equals("A2")) {
            sesionUsuario = request.getSession(true);
            sesionUsuario.setAttribute("usuario", correo);
            sesionUsuario.setAttribute("estadoUsuario", resp);
            response.sendRedirect("../aspirante/administrarAspirante.jsp?requerimiento=mostrarInicio");
        } else if (resp.equals("E0")) {
            sesionUsuario = request.getSession(true);
            sesionUsuario.setAttribute("usuario", correo);
            sesionUsuario.setAttribute("estadoUsuario", resp);
            response.sendRedirect("../estudiante/administrarEstudiante.jsp?requerimiento=mostrarInicio");
        } else if (resp.equals("E1")) {
            sesionUsuario = request.getSession(true);
            sesionUsuario.setAttribute("usuario", correo);
            sesionUsuario.setAttribute("estadoUsuario", resp);
            response.sendRedirect("../estudiante/administrarEstudiante.jsp?requerimiento=mostrarInicio");
        } else if (resp.equals("E2")) {
            sesionUsuario = request.getSession(true);
            sesionUsuario.setAttribute("usuario", correo);
            sesionUsuario.setAttribute("estadoUsuario", resp);
            response.sendRedirect("../estudiante/administrarEstudiante.jsp?requerimiento=mostrarInicio");
        } else if (resp.equals("E3")) {
            sesionUsuario = request.getSession(true);
            sesionUsuario.setAttribute("usuario", correo);
            sesionUsuario.setAttribute("estadoUsuario", resp);
            response.sendRedirect("../estudiante/administrarEstudiante.jsp?requerimiento=mostrarInicio");
        } else if (resp.equals("D0")) {
            out.print("Bienvenido, eres el administrador");
            sesionUsuario = request.getSession(true);
            sesionUsuario.setAttribute("usuario", correo);
            sesionUsuario.setAttribute("estadoUsuario", resp);
            response.sendRedirect("../docente/administrarDocente.jsp?requerimiento=mostrarInicio");
        } else if (resp.equals("D1")) {
            out.print("Bienvenido, eres un profesor");
            sesionUsuario = request.getSession(true);
            sesionUsuario.setAttribute("usuario", correo);
            sesionUsuario.setAttribute("estadoUsuario", resp);
            response.sendRedirect("../docente/administrarDocente.jsp?requerimiento=mostrarInicio");
        } else if (resp.equals("D2")) {
            //out.print("Bienvenido, eres un docente coordinador");
            sesionUsuario = request.getSession(true);
            sesionUsuario.setAttribute("usuario", correo);
            sesionUsuario.setAttribute("estadoUsuario", resp);
            response.sendRedirect("../docente/administrarDocente.jsp?requerimiento=mostrarInicio");
        } else if (resp.equals("D3")) {
            out.print("Bienvenido, eres un profesor-coordinador");
            sesionUsuario = request.getSession(true);
            sesionUsuario.setAttribute("usuario", correo);
            sesionUsuario.setAttribute("estadoUsuario", resp);
            response.sendRedirect("../docente/administrarDocente.jsp?requerimiento=mostrarInicio");
        } else if (resp.equals("D4")) {
            out.print("Bienvenido, eres un administrador-profesor");
            sesionUsuario = request.getSession(true);
            sesionUsuario.setAttribute("usuario", correo);
            sesionUsuario.setAttribute("estadoUsuario", resp);
            response.sendRedirect("../docente/administrarDocente.jsp?requerimiento=mostrarInicio");
        } else if (resp.equals("D5")) {
            out.print("Bienvenido, eres un administrador-coordinador");
            sesionUsuario = request.getSession(true);
            sesionUsuario.setAttribute("usuario", correo);
            sesionUsuario.setAttribute("estadoUsuario", resp);
            response.sendRedirect("../docente/administrarDocente.jsp?requerimiento=mostrarInicio");
        } else if (resp.equals("D6")) {
            out.print("Bienvenido, eres un docente de todos los tipos");
            sesionUsuario = request.getSession(true);
            sesionUsuario.setAttribute("usuario", correo);
            sesionUsuario.setAttribute("estadoUsuario", resp);
            response.sendRedirect("../docente/administrarDocente.jsp?requerimiento=mostrarInicio");

        } else {

            String mensaje = "";

            if (resp.equals("-1")) {
                mensaje = "Datos incorrectos, verifique su usuario y contraseña\n" + respuesta[0];
            } else if (resp.equals("-2")) {
                mensaje = "Su cuenta se encuentra inhabilitada";
            }
            error = "<div class=\"row\">"
                    + "<div class=\"col-xs-offset-1 col-xs-10 alert alert-success\">"
                    + "<div id=\"error\">"
                    + "<p><strong>"
                    + mensaje
                    + "</strong>"
                    + "</p>"
                    + "</div>"
                    + "</div>"
                    + "</div>";

            session.setAttribute("Mensaje", error);
            response.sendRedirect("iniciarSesion.jsp");
        }

        /*
         if(resp){
         //session.setAttribute("nombre",usuario.getNombre());
         //session.setAttribute("apellido", usuario.getApellido());
         response.sendRedirect("administrarCoordinador.jsp");
         //out.println("Conecto");
         }
         else{
         response.sendRedirect("iniciarSesion.jsp");
         //out.println("No Conecto");
         }
         */
    } else if (boton.equals("registrarAspirante")) {
        response.sendRedirect("../estudiante/estudiante.jsp");
        
    } else if (boton.equals("mostrarRecuperarContrasenia")) {
        response.sendRedirect("recuperarContrasenia.jsp");
        
    } else if(boton.equals("recuperarContrasenia")){
                        
        String contrasenia = facade.consultarUsuario(request.getParameter("correo"));
        
        if(!contrasenia.isEmpty()){
            
            boolean x = facade.enviarEmail(request.getParameter("correo"), contrasenia);
            if(x){
                session.setAttribute("Mensaje", "<div class=\"row\">"
                    + "<div class=\"col-xs-offset-1 col-xs-10 alert alert-success\">"
                    + "<div id=\"error\">"
                    + "<p><strong>Se ha enviado la contraseña de su usuario a su cuenta de "
                        + "correo electrónico."
                    +"</strong>"
                    + "</p>"
                    + "</div>"
                    + "</div>"
                    + "</div>");
                response.sendRedirect("iniciarSesion.jsp");
            }
            else{
                session.setAttribute("MensajeRecuperar", "<div class=\"row\">"
                    + "<div class=\"col-xs-offset-1 col-xs-10 alert alert-danger\">"
                    + "<div id=\"error\">"
                    + "<p><strong>Ha ocurrido un error al intentar enviar la contraseña"
                        + "a su cuenta de correo electrónico, intente nuevamente."
                    + "</strong>"
                    + "</p>"
                    + "</div>"
                    + "</div>"
                    + "</div>");
                response.sendRedirect("recuperarContrasenia.jsp");
            }
        }
        else{
            session.setAttribute("MensajeRecuperar", "<div class=\"row\">"
                    + "<div class=\"col-xs-offset-1 col-xs-10 alert alert-danger\">"
                    + "<div id=\"error\">"
                    + "<p><strong>Datos incorrectos. Ingrese un correo válido."
                    + "</strong>"
                    + "</p>"
                    + "</div>"
                    + "</div>"
                    + "</div>");
                response.sendRedirect("recuperarContrasenia.jsp");
        }
               
    }
    else if (boton.equals("cerrarSesion")) {
        sesionUsuario = request.getSession(true);
        sesionUsuario.setAttribute("Mensaje", "");
        sesionUsuario.invalidate();
        response.sendRedirect("iniciarSesion.jsp");
    }


%>
