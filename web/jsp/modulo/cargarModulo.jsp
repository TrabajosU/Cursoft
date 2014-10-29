<%-- 
    Document   : cargarModulo
    Created on : 23/10/2014, 03:22:24 PM
    Author     : Manuel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="facade" class="com.cursoft.facade.Facade" ></jsp:useBean>

<%
    System.out.println(request.getParameter("posicion"));
    int pos = Integer.parseInt(request.getParameter("posicion"));
    String modulos [] = session.getAttribute("listadoModulos").toString().split(";");
    String nombre = modulos[pos];
    String lista = facade.listarEstudiantesModulo(nombre);
    
    System.out.println(lista);
    
%>