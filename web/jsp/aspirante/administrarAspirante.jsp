<%-- 
    Document   : administrarAspirante
    Created on : 12/10/2014, 10:59:23 PM
    Author     : Jhorman Perez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="facade" class="com.cursoft.facade.Facade"></jsp:useBean>
<jsp:useBean id="usuario" class="com.cursoft.dto.UsuarioDto"></jsp:useBean>
<jsp:useBean id="aspirante" class="com.cursoft.dto.AspiranteDto"></jsp:useBean>
<%@page session='true'%>


<%

    String req = request.getParameter("requerimiento");
    session.setAttribute("requerimiento", req);

    HttpSession sesionUsuario = request.getSession(true);

    if (sesionUsuario.isNew()) {
        response.sendRedirect("../usuario/iniciarSesion.jsp");
        return;
    }
    if (sesionUsuario == null || sesionUsuario.getAttribute("usuario") == null) {
        response.sendRedirect("../usuario/iniciarSesion.jsp");
        return;
    }

    String resp = "";

    if (req.equals("mostrarInicio")) {

        resp = facade.consultarAspiranteCorreo((String) sesionUsuario.getAttribute("usuario"));
        
        sesionUsuario.setAttribute("nombre", (String) resp.split("-")[3]);
        sesionUsuario.setAttribute("apellido", (String) resp.split("-")[4]);

        if (sesionUsuario.getAttribute("estadoUsuario").equals("A0")) {
            response.sendRedirect("inicioAspirantePendiente.jsp");
        }
        if (sesionUsuario.getAttribute("estadoUsuario").equals("A1")) {
            response.sendRedirect("inicioAspiranteAprobado.jsp");
        }
        if (sesionUsuario.getAttribute("estadoUsuario").equals("A2")) {
            response.sendRedirect("inicioAspiranteRechazado.jsp");
        }
    } else if (req.equals("consultarCorreo")) {
        
        resp = facade.consultarAspiranteCorreo((String) sesionUsuario.getAttribute("usuario"));
        
        sesionUsuario.setAttribute("codigo", "value=" + "\"" + (String) resp.split("-")[0] + "\"");
        sesionUsuario.setAttribute("correo", "value=" + "\"" + (String) resp.split("-")[1] + "\"");
        sesionUsuario.setAttribute("contrasenia", "value=" + "\"" + (String) resp.split("-")[2] + "\"");
        sesionUsuario.setAttribute("contrasenia2", "value=" + "\"" + (String) resp.split("-")[2] + "\"");
        sesionUsuario.setAttribute("nombre", (String) resp.split("-")[3]);
        sesionUsuario.setAttribute("apellido", (String) resp.split("-")[4]);
        sesionUsuario.setAttribute("tipoDocumento", "value=" + "\"" + (String) resp.split("-")[5] + "\"");
        sesionUsuario.setAttribute("documento", "value=" + "\"" + (String) resp.split("-")[6] + "\"");
        sesionUsuario.setAttribute("fechaNacimiento", "value=" + "\"" + (String) resp.split("-")[7] + "\"");
        sesionUsuario.setAttribute("direccion", "value=" + "\"" + (String) resp.split("-")[8] + "\"");
        sesionUsuario.setAttribute("telefono", "value=" + "\"" + (String) resp.split("-")[9] + "\"");
        sesionUsuario.setAttribute("telefonoMovil", "value=" + "\"" + (String) resp.split("-")[10] + "\"");

        sesionUsuario.setAttribute("promedio", "value=" + "\"" + (String) resp.split("-")[11] + "\"");
        sesionUsuario.setAttribute("semestreTerminacionMaterias", "value=" + "\"" + (String) resp.split("-")[12] + "\"");

        response.sendRedirect("aspirante.jsp");

    } else if (req.equals("consultar")) {

        resp = facade.consultarAspiranteCodigo(request.getParameter("codigo"));
        
        sesionUsuario.setAttribute("codigo", "value=" + "\"" + (String) resp.split("-")[0] + "\"");
        sesionUsuario.setAttribute("correo", "value=" + "\"" + (String) resp.split("-")[1] + "\"");
        sesionUsuario.setAttribute("contrasenia", "value=" + "\"" + (String) resp.split("-")[2] + "\"");
        sesionUsuario.setAttribute("contrasenia2", "value=" + "\"" + (String) resp.split("-")[2] + "\"");
        sesionUsuario.setAttribute("nombre", (String) resp.split("-")[3]);
        sesionUsuario.setAttribute("apellido", (String) resp.split("-")[4]);
        sesionUsuario.setAttribute("tipoDocumento", "value=" + "\"" + (String) resp.split("-")[5] + "\"");
        sesionUsuario.setAttribute("documento", "value=" + "\"" + (String) resp.split("-")[6] + "\"");
        sesionUsuario.setAttribute("fechaNacimiento", "value=" + "\"" + (String) resp.split("-")[7] + "\"");
        sesionUsuario.setAttribute("direccion", "value=" + "\"" + (String) resp.split("-")[8] + "\"");
        sesionUsuario.setAttribute("telefono", "value=" + "\"" + (String) resp.split("-")[9] + "\"");
        sesionUsuario.setAttribute("telefonoMovil", "value=" + "\"" + (String) resp.split("-")[10] + "\"");

        sesionUsuario.setAttribute("promedio", "value=" + "\"" + (String) resp.split("-")[11] + "\"");
        sesionUsuario.setAttribute("semestreTerminacionMaterias", "value=" + "\"" + (String) resp.split("-")[12] + "\"");

        response.sendRedirect("aspirante.jsp");
    } else {
        response.sendRedirect("../usuario/iniciarSesion.jsp");
    }


%>