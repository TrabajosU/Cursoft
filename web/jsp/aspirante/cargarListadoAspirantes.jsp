<%-- 
    Document   : cargarListadoAspirantes
    Created on : 18/10/2014, 11:08:06 AM
    Author     : Manuel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="facade" class="com.cursoft.facade.Facade" ></jsp:useBean>

<%
    String lista = facade.consultarAspirantes();
    if(!lista.isEmpty()){
        String listadoHtml ="";
        String [] asp = lista.split(";");
        for(int i =0; i<asp.length; i++){
            String [] aspirante = asp[i].split(",,");
            listadoHtml += "<tr>"+"<td>"+aspirante[0]+"</td>"+"<td>"+aspirante[1]+" "+aspirante[2]+"</td>";
            int estado = Integer.parseInt(aspirante[3]);
            String es ="";
            if(estado == 0)
                es = "Pendiente";
            else if(estado==1)
                es = "Aceptado";
            else if(estado==2)
                es = "Rechazado";
            listadoHtml += "<td>"+es+"</td></tr>";
        }
        session.setAttribute("listadoAspirantes", listadoHtml);
    }
    response.sendRedirect("listadoAspirantes.jsp");
    
%>