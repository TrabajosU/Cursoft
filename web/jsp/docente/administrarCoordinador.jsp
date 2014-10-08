<%-- 
    Document   : administrarCoordinador
    Created on : 8/10/2014, 02:46:25 PM
    Author     : Manuel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="facade" class="com.cursoft.facade.Facade"></jsp:useBean>


<%
    String aspirantes = facade.consultarAspirantes();
    String estudiantes = facade.consultarEstudiantes();
    
    System.out.println("Aspirantes:     "+aspirantes);
    System.out.println("Estudiantes:     "+estudiantes);
    
    String aspi ="";
    
    String [] asp = aspirantes.split(";");
    for(int i =0; i<asp.length; i++){
        String [] asp2 = asp[i].split("-");
        aspi += "<tr>"+"\n"+"<td>"+(i+1)+"</td>"+"\n"+"<td>"+asp2[0]+"</td>"+"\n"+"<td>"+asp2[1]+" "+asp2[2]+"</td>"+"\n";
        int estado = Integer.parseInt(asp2[3]);
        String [] estad ={"Pendiente","Aceptado","Rechazado"};
        String value ="";
        if(estado ==0){
            value = "<option value=\"" + (estado+2) +"\">"+ estad[estado+1] +"</option>" + "\n\t\t\t\t\t\t\t"+
                    "<option value=\"" + (estado+3) +"\">"+ estad[estado+2] +"</option>" + "\n\t\t\t\t\t\t\t";
        }
        else if(estado ==1){
            value = "<option value=\"" + (estado+1) +"\">"+ estad[estado-1] +"</option>" + "\n\t\t\t\t\t\t\t"+
                    "<option value=\"" + (estado+2) +"\">"+ estad[estado+1] +"</option>" + "\n\t\t\t\t\t\t\t";
        }
        else if(estado ==2){
            value = "<option value=\"" + (estado-1) +"\">"+ estad[estado-2] +"</option>" + "\n\t\t\t\t\t\t\t"+
                    "<option value=\"" + (estado) +"\">"+ estad[estado-1] +"</option>" + "\n\t\t\t\t\t\t\t";
        }
        
        String values ="<option value=\"" + (estado+1) +"\">"+ estad[estado] +"</option>" + "\n\t\t\t\t\t\t\t"+"\t\t\t" + value;
        
        aspi +="<td>"+"<div class="+"\"col-xs-12 col-sm-6 col-md-8\">"+"\n"+
                "<select class="+"\"form-control\"" +"id="+"\"idTipoDocumento\""+"name="+"\"estado\"" + "enabled>"+ values+
                "</select>"+"\n"+"</div>"+"</td>"+ "\n"+"</tr>";
    }
    session.setAttribute("aspirantes", aspi);
    response.sendRedirect("coordinador.jsp");
%>
