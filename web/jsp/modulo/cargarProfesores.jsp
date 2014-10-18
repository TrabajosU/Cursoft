<%-- 
    Document   : cargarProfesores
    Created on : 11/10/2014, 11:30:04 PM
    Author     : Manuel
--%>

<%@page import="java.util.Enumeration"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="facade" class="com.cursoft.facade.Facade"></jsp:useBean>

<%
    // Volver todos los elementos de una session null..
    Enumeration<String> atributos = session.getAttributeNames();
    while(atributos.hasMoreElements()){
        String name = atributos.nextElement();
        session.setAttribute(name, null);
    }
    System.gc(); //<-- Activar el recolector de basura
    String profesores = facade.consultarProfesores();
    session.setAttribute("profesores", profesores);
    response.sendRedirect("modulo.jsp");
%>
