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
    session.setAttribute("nombreModulo", nombre);
    System.out.println(lista);
    String listado ="";
    String estudiantes [] = lista.split(";");
    for(int i =0; i<estudiantes.length; i++){
        String datos [] = estudiantes[i].split(",,");
        //String posicionNota = "posicion"+i;
        listado += "<tr><td>"+datos[0]+"</td><td>"+datos[1]+"</td><td>"+"<div class=\"form-group\">"+"<div class=\"col-xs-5 col-sm-5 col-md-5\">"+
                                                    "<div class=\"input-group\">"+
                                                        "<span class=\"input-group-addon\">"+"<span class=\"glyphicon glyphicon-lock\">"+"</span></span>"+
                                                        "<input type="+"\"hidden\""+ "name="+"\"posicion\""+ "value="+"\""+i+"\""+">"+
                                                        "<input class=\"form-control\" id=\"nota\" name=\"nota"+i+"\" placeholder= \"0.0\" type = \"text\">"+
                                                    "</div>"+
                                                "</div>"+"</div>"+
                                                "</td></tr>";
    }
    
    session.setAttribute("estudiantesModulo", listado);
    session.setAttribute("listadoEstudiantesModulo", lista);
    response.sendRedirect("../nota/notasModulos.jsp");
    
%>