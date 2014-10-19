<%-- 
    Document   : index.jsp
    Created on : 18-oct-2014, 14:59:13
    Author     : Jhorman Perez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="facade" class="com.cursoft.facade.Facade" ></jsp:useBean>

<%

    //response.sendRedirect("jsp/usuario/iniciarSesion.jsp");
    boolean x = facade.hayConexion();
    
    if(x)
        response.sendRedirect("jsp/usuario/iniciarSesion.jsp");
    else
        System.out.println("no hay conexion");

%>
