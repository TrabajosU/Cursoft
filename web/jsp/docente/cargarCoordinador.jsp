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
        
        int a=0,e=0;
        if(aspirantes.isEmpty()){
            session.setAttribute("aspirantes", " ");
            a=1;
        }
        if(estudiantes.isEmpty()){
            session.setAttribute("estudiantes", " ");
            e=1;
        }
        
        if(a!=1){
    
        session.setAttribute("listaAspirantes", aspirantes);
        String aspi ="";
    System.out.println("comenzo con aspirantes");
        String [] asp = aspirantes.split(";");
        for(int i =0; i<asp.length; i++){
            String [] asp2 = asp[i].split(",,");
            //aspi += "<tr>"+"<td>"+(i+1)+"</td>"+"<td>"+asp2[0]+"</td>"+"<td>"+asp2[1]+" "+asp2[2]+"</td>";
            
            
            int estado = Integer.parseInt(asp2[3]);
            String [] estad ={"Pendiente","Aprobado","Rechazado"};
            String value ="";
          if(estado!=1){
            aspi += "<tr>"+"<td>"+(i+1)+"</td>"+"<td>"+asp2[0]+"</td>"+"<td>"+asp2[1]+" "+asp2[2]+"</td>";
            if(estado ==0){
                value = "<option value= \"" + (estado+2) +"\">"+ estad[estado+1] +"</option>" + "\n\t\t\t\t\t\t\t"+
                    "<option value= \"" + (estado+3) +"\">"+ estad[estado+2] +"</option>" + "\n\t\t\t\t\t\t\t";
            }/*
            else if(estado ==1){
                value = "<option value= \"" + (estado) +"\">"+ estad[estado-1] +"</option>" + "\n\t\t\t\t\t\t\t"+
                    "<option value= \"" + (estado+2) +"\">"+ estad[estado+1] +"</option>" + "\n\t\t\t\t\t\t\t";
            }*/
            else if(estado ==2){
                value = "<option value= \"" + (estado-1) +"\">"+ estad[estado-2] +"</option>" + "\n\t\t\t\t\t\t\t"+
                    "<option value= \"" + (estado) +"\">"+ estad[estado-1] +"</option>" + "\n\t\t\t\t\t\t\t";
            }
          
            String values ="<option value= \"" + (estado+1) +"\">"+ estad[estado] +"</option>" + "\n\t\t\t\t\t\t\t" + value;
        
            aspi +="<td>"+"<form action="+"\"administrarFuncionesCoordinador.jsp\""+ "class="+"\"form-horizontal\""+
                    "method="+"\"get\"" +"role="+"\"form\""+">"+"<div class="+"\"col-xs-12 col-sm-2 col-md-10\">"+
                "<select class="+"\"form-control\"" +"id="+"\"estado\""+"name="+"\"estado"+i +"\"" + "enabled>"+ values+
                "</select>"+"</div>"+"</td>"+"<td>"+ 
                        "<div class="+"\"form-group\""+">"+
                            "<div class="+"\"row\""+">"+
                                "<div class="+"\"col-xs-offset-0 col-xs-6 text-center\""+">"+
                                    "<input type="+"\"hidden\""+ "name="+"\"posicion\""+ "value="+"\""+i+"\""+">"+
                                    "<button class="+"\"btn btn-danger\""+ "id="+"\"guardar\"" +"name="+"\"requerimiento\""+
                    "value="+"\"guardarCambiosAspirante\""+ "type="+"\"submit\""+">"+"Guardar"+"</button>"+
                                "</div>"+
                            "</div>"+
                        "</div>"+
                    "</form>"+"</td>"+"</tr>";
          }
        }
        if(aspi.isEmpty()){
            aspi = "No hay Aspirantes por revisar";
        }
        session.setAttribute("aspirantes", aspi);
    System.out.println("termino con aspirantes");
        }
        
        if(e!=1){
        session.setAttribute("listaEstudiantes", estudiantes);
    
    System.out.println("comenzo con estudiantes");
        String estu ="";
    
        String [] est = estudiantes.split(";");
        for(int i =0; i<est.length; i++){
            System.out.println("entro al for y el valor de i es: "+i);
            String [] asp2 = est[i].split(",,");
            //estu += "<tr>"+"<td>"+(i+1)+"</td>"+"<td>"+asp2[0]+"</td>"+"<td>"+asp2[1]+" "+asp2[2]+"</td>";
            int estado = Integer.parseInt(asp2[3]);
          if(estado != 1){
            estu += "<tr>"+"<td>"+(i+1)+"</td>"+"<td>"+asp2[0]+"</td>"+"<td>"+asp2[1]+" "+asp2[2]+"</td>";
            String [] estad ={"Pendiente","Aprobado","Rechazado"};
            String value ="";
            if(estado ==0){
                value = "<option value=\"" + (estado+2) +"\">"+ estad[estado+1] +"</option>" + "\n\t\t\t\t\t\t\t"+
                    "<option value=\"" + (estado+3) +"\">"+ estad[estado+2] +"</option>" + "\n\t\t\t\t\t\t\t";
            }/*
            else if(estado ==1){
                value = "<option value=\"" + (estado) +"\">"+ estad[estado-1] +"</option>" + "\n\t\t\t\t\t\t\t"+
                    "<option value=\"" + (estado+2) +"\">"+ estad[estado+1] +"</option>" + "\n\t\t\t\t\t\t\t";
            }*/
            else if(estado ==2){
                value = "<option value=\"" + (estado-1) +"\">"+ estad[estado-2] +"</option>" + "\n\t\t\t\t\t\t\t"+
                    "<option value=\"" + (estado) +"\">"+ estad[estado-1] +"</option>" + "\n\t\t\t\t\t\t\t";
            }
        
            String values ="<option value=\"" + (estado+1) +"\">"+ estad[estado] +"</option>" + "\n\t\t\t\t\t\t\t"+ value;
        
            estu +="<td>"+"<form action="+"\"administrarFuncionesCoordinador.jsp\""+ "class="+"\"form-horizontal\""+
                    "method="+"\"get\"" +"role="+"\"form\""+">"+"<div class="+"\"col-xs-12 col-sm-2 col-md-10\">"+
                "<select class="+"\"form-control\"" +"id="+"\"estado\""+"name="+"\"estado"+i +"\"" + "enabled>"+ values+
                "</select>"+"</div>"+"</td>"+"<td>"+ 
                        "<div class="+"\"form-group\""+">"+
                            "<div class="+"\"row\""+">"+
                                "<div class="+"\"col-xs-offset-0 col-xs-6 text-center\""+">"+
                                    "<input type="+"\"hidden\""+ "name="+"\"posicion\""+ "value="+"\""+i+"\""+">"+
                                    "<button class="+"\"btn btn-danger\""+ "id="+"\"guardar\"" +"name="+"\"requerimiento\""+
                    "value="+"\"guardarCambiosEstudiante\""+ "type="+"\"submit\""+">"+"Guardar"+"</button>"+
                                "</div>"+
                            "</div>"+
                        "</div>"+
                    "</form>"+"</td>"+"</tr>";
          }
            
        }
        if(estu.isEmpty()){
            estu = "No hay estudiantes por revisar";
        }
        session.setAttribute("estudiantes", estu);
    System.out.println("termino con estudiantes");
        }
    
        response.sendRedirect("coordinador.jsp");
    
%>
