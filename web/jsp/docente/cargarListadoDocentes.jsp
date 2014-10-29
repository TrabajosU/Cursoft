<%-- 
    Document   : listadoDocentes
    Created on : 17/10/2014, 04:42:09 PM
    Author     : Manuel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="facade" class="com.cursoft.facade.Facade" ></jsp:useBean>
<%
   String lista = facade.listarDocentes();
   if(!lista.isEmpty()){
        String [] listaDocentes = lista.split("::");
        String listadoHtml ="";
        for(int i=0; i<listaDocentes.length; i++){
            String [] docente = listaDocentes[i].split(",,");
            listadoHtml += "<tr>"+"<td>"+docente[0]+"</td>"+"<td>"+docente[1]+"</td>";
            String [] modulos = docente[2].split("/");
            String listaMod = "<ul>";
            for(int j=0; j<modulos.length; j++){
                listaMod += "<li>"+modulos[j]+"</li>";
            }
            listaMod += "</ul>";
            listadoHtml += "<td>"+listaMod+"</td>"+"</td>";
        }
        session.setAttribute("listadoDocentes", listadoHtml);
   }
   response.sendRedirect("listadoDocentes.jsp");
   
%>