<%-- 
    Document   : cargarProfesores
    Created on : 11/10/2014, 11:30:04 PM
    Author     : Manuel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="facade" class="com.cursoft.facade.Facade"></jsp:useBean>

<%
    String profesores = facade.consultarProfesores();
    session.setAttribute("profesores", profesores);
    response.sendRedirect("modulo.jsp");
%>
