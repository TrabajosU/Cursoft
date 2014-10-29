<%-- 
    Document   : cargarListadoEstudiantes
    Created on : 18/10/2014, 12:20:15 PM
    Author     : Manuel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="facade" class="com.cursoft.facade.Facade" ></jsp:useBean>

<%
    String lista = facade.consultarEstudiantes();
    if(!lista.isEmpty()){
        String listadoHtml ="";
        String [] est = lista.split(";");
        for(int i =0; i<est.length; i++){
            String [] estudiante = est[i].split(",,");
            listadoHtml += "<tr>"+"<td>"+estudiante[0]+"</td>"+"<td>"+estudiante[1]+" "+estudiante[2]+"</td>";
            int estado = Integer.parseInt(estudiante[3]);
            String es ="";
            if(estado == 0)
                es = "Pendiente";
            else if(estado==1)
                es = "Aceptado";
            else if(estado==2)
                es = "Rechazado";
            listadoHtml += "<td>"+es+"</td></tr>";
        }
        session.setAttribute("listadoEstudiantes", listadoHtml);
    }
    response.sendRedirect("listadoEstudiantes.jsp");
%>  
