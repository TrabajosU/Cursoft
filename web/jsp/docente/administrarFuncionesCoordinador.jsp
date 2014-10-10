<%-- 
    Document   : administrarFuncionesCoordinador
    Created on : 9/10/2014, 06:51:25 PM
    Author     : Manuel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="facade" class="com.cursoft.facade.Facade"></jsp:useBean>
<jsp:useBean id="usuario" class="com.cursoft.dto.UsuarioDto"></jsp:useBean>
<jsp:useBean id="aspirante" class="com.cursoft.dto.AspiranteDto"></jsp:useBean>
<jsp:useBean id="estudiante" class="com.cursoft.dto.EstudianteDto"></jsp:useBean>

<%
    String bot = request.getParameter("requerimiento");
    if(bot.equals("guardarCambiosAspirante")){
        System.out.println("llego a guardarCambiosAspirante");
        String asp = session.getAttribute("listaAspirantes").toString();
        System.out.println("lista de aspirantes :: "+asp);
        String aspirantes [] = asp.split(";");
        System.out.println("la posicion es:  "+ request.getParameter("posicion"));
        int i = Integer.parseInt(request.getParameter("posicion"));

        String datos [] = aspirantes[i].split("-");
        String codigo = datos[0];
        String numEstado = "estado"+i;
        System.out.println("El estado numero:     "+request.getParameter(numEstado));
        
        int estado = Integer.parseInt(request.getParameter(numEstado));
        System.out.println("El estado en el jsp es:    "+estado);
        usuario.setCodigo(codigo);
        aspirante.setEstado(String.valueOf(estado));
        facade.actualizarAspiranteEstado(usuario,aspirante);
        }
    else if(bot.equals("guardarCambiosEstudiante")) {
        System.out.println("llego a guardarCambiosEstudiantee");
        String asp = session.getAttribute("listaEstudiantes").toString();
        System.out.println("lista de estudiantes :: "+asp);
        String estudiantes [] = asp.split(";");
        System.out.println("la posicion es:  "+ request.getParameter("posicion"));
        int i = Integer.parseInt(request.getParameter("posicion"));

        String datos [] = estudiantes[i].split("-");
        String codigo = datos[0];
        String numEstado = "estado"+i;
        System.out.println("El estado numero:     "+request.getParameter(numEstado));
        
        int estado = Integer.parseInt(request.getParameter(numEstado));
        System.out.println("El estado en el jsp es:    "+estado);
        usuario.setCodigo(codigo);
        estudiante.setEstado(String.valueOf(estado));
        facade.actualizarEstudianteEstado(usuario,estudiante);
    }
    
     response.sendRedirect("administrarCoordinador.jsp");   
%> 
