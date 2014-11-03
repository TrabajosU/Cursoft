<%-- 
    Document   : administrarNotas
    Created on : 29/10/2014, 05:00:42 PM
    Author     : Manuel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="facade" class="com.cursoft.facade.Facade" ></jsp:useBean>

<%
    String listado ="";
    String estudiantes [] = session.getAttribute("listadoEstudiantesModulo").toString().split(";");
    
    for(int i = 0; i<estudiantes.length; i++){
        //String pos = "posicion"+i;
        //double nota = Double.parseDouble(request.getParameter(pos));
        System.out.println("la posicion es: " +request.getParameter("posicion"));
        //System.out.println("la posicionNOTA es: " +request.getParameter("posicionNota"));
        String nota = request.getParameter("nota"+i);
        System.out.println("la nota es   "+ nota);
        String estudiante = estudiantes[i].split(",,")[0];
        System.out.println("estuditnate : "+estudiante);
        listado += estudiante + ",," + nota + ";";
    }
    facade.registrarNotasModulos(listado, session.getAttribute("nombreModulo").toString());
    response.sendRedirect("../docente/cargarProfesor.jsp");
    
%>
