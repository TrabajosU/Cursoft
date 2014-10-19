<%-- 
    Document   : cargarListadoModulos
    Created on : 18/10/2014, 12:48:19 PM
    Author     : Manuel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="facade" class="com.cursoft.facade.Facade" ></jsp:useBean>

<%
    String lista = facade.listarModulos();
    System.out.println("la lista de los modulos es : "+lista);
    if(!lista.isEmpty()){
        String listadoHtml ="";
        String [] mods = lista.split(";");
        for(int i =0; i<mods.length; i++){
            String [] modulo = mods[i].split(",,");
            listadoHtml += "<tr>"+"<td>"+modulo[0]+"</td>";
            int tipo = Integer.parseInt(modulo[1]);
            String es ="";
            if(tipo == 1)
                es = "fijo";
            else if(tipo==2)
                es = "Acompañamiento";
           
            listadoHtml += "<td>"+es+"</td><td>"+modulo[2]+"</td></tr>";
        }
        session.setAttribute("listadoModulos", listadoHtml);
    }
    response.sendRedirect("listadoModulos.jsp");
    
    
%>
