<%-- 
    Document   : administrarHorarios
    Created on : 11/10/2014, 04:42:55 PM
    Author     : Manuel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String bot = request.getParameter("requerimiento");
    
    
    if(bot.equals("crearHorario")){
       String dia = request.getParameter("dia");
       String horaInicio = request.getParameter("horaInicio");
       String horaFin = request.getParameter("horaFin");
       String salon = request.getParameter("salon");
       
       session.setAttribute("dia", "value="+ "\""+dia+ "\" disabled");
       session.setAttribute("horaInicio", "value="+ "\""+horaInicio+ "\" disabled");
       session.setAttribute("horaFin", "value="+ "\""+horaFin+ "\" disabled");
       session.setAttribute("salon", "value="+ "\""+salon+ "\" disabled");
       session.setAttribute("cargarbtn", "disabled");
       String cad;
       
       if(session.getAttribute("horario")==null){
           cad = dia +"-"+horaInicio+"-"+horaFin+"-"+salon+";";
           session.setAttribute("horario",cad);
       }
       else{
           cad = session.getAttribute("horario").toString();
           cad += dia +"-"+horaInicio+"-"+horaFin+"-"+salon+";";
           session.setAttribute("horario", cad);
       } 
       
       System.out.println("el horario es: "+cad);
       
       
       
       response.sendRedirect("horario.jsp");
    }
    else if(bot.equals("nuevoHorario")){
        
        int pos;
        
        if(session.getAttribute("posicion")==null){
            pos = 1;
            
            session.setAttribute("posicion", pos+1);
            System.out.println("le asigno una vez");
        }
        else{
            pos = Integer.parseInt(session.getAttribute("posicion").toString());
            System.out.println("lo leyo");
            session.setAttribute("posicion", (pos+1));
        }
        //+" <% out.print(session.getAttribute("+"\"dia\""+"))"+";"+"%"+">"
        String hor = "<tr>"+"<form"+ " action="+"\"administrarHorarios.jsp\""+ "class="+"\"form-horizontal\"" +"method="+"\"get\""+ "role="+"\"form\""+">"+"<td>"+(pos+1)+ "</td>"+
                    "<td>"+ "<input"+ " class="+"\"form-control\""+ " id="+"\"horario\""+ " name="+"\"dia\""+ " placeholder="+"\"Lunes\""+ " type="+"\"text\""+" <"+"%"+ " out.print(session.getAttribute("+"\"dia\""+"))"+";" +" >"+"</td>"+
                     "<td>"+ "<input"+ " class="+"\"form-control\""+ " id="+"\"horario\""+ " name="+"\"horaInicio\""+ " placeholder="+"\"6:00 pm\""+ " type="+"\"text\""+" <"+"%"+ " out.print(session.getAttribute("+"\"horaInicio\""+"))"+";" +" >"+"</td>"+
                     "<td>"+ "<input"+ " class="+"\"form-control\""+ "id="+"\"horario\""+ "name="+"\"horaFin\""+ "placeholder="+"\"9:00 pm\""+ "type="+"\"text\""+" <"+"%"+ " out.print(session.getAttribute("+"\"horaFin\""+"))"+";" +" >"+ "</td>"+ 
                     "<td>"+ "<input"+ " class="+"\"form-control\""+ "id="+"\"horario\""+ "name="+"\"salon\""+ "placeholder="+"\"SA 308\""+ "type="+"\"text\""+" <"+"%"+" out.print(session.getAttribute("+"\"salon\""+"))"+";"+" >" +"</td>"+ 
                      "<td>"+ 
                       "<div"+ " class="+"\"form-group\""+">"+
                       "<div"+ " class="+"\"row\">"+
                       "<div"+ " class="+"\"col-xs-offset-0 col-xs-6 text-center\""+">"+
                       "<input type="+"\"hidden\""+ " name="+"\"posicion\"" +"\"value=\""+"\""+(pos+1)+"\">"+
                        "<button class="+"\"btn btn-danger\""+ "id="+"\"guardar\"" +"name="+"\"requerimiento\""+ "value="+"\"crearHorario\""+" type="+"\"submit\""+" <"+ "%"+" out.print(session.getAttribute("+"\"crearbtn\""+"))"+";"+" >"+"Crear</button>"+
                        "</div>"+
                        "</div>"+
                        "</div>"+
                        "</td>"+
                        "</form>"+
                        "</tr>";
        
        
        
        
       
        String nombreHorario = "newHorario"+(pos+1);
        
        String cad="";
        if(session.getAttribute("cad")==null){
            session.setAttribute("cad",hor);
            cad = hor;
        }
        else{
            cad = session.getAttribute("cad").toString();
            session.setAttribute("cad",cad+hor);
            cad = session.getAttribute("cad").toString();
        }
        
        
        session.setAttribute(nombreHorario,cad);
        
        response.sendRedirect("horario.jsp");
    }
    
    else if(bot.equals("asignarHorario")){
        response.sendRedirect("modulo.jsp");
        
    }
    
%>
