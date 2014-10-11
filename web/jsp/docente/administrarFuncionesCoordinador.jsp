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
<jsp:useBean id="docente" class="com.cursoft.dto.DocenteDto"></jsp:useBean>

<%
    String bot = request.getParameter("requerimiento");
    int r = 0;
    if(bot.equals("guardarCambiosAspirante")){
        r = 1;
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
        r = 1;
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
    else if(bot.equals("registrar")){
        String codigo = request.getParameter("codigo");   
        String correo = request.getParameter("correo");
        String contrasenia = request.getParameter("contrasenia");
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        int idTipoDocumento = Integer.parseInt(request.getParameter("idTipoDocumento"));
        String numeroDocumento = request.getParameter("numeroDocumento");
        String fechaNacimiento = request.getParameter("fechaNacimiento");
        String direccion = request.getParameter("direccion");
        String telefono = request.getParameter("telefono");
        String telefonoMovil = request.getParameter("telefonoMovil");
        
        int escolaridad = Integer.parseInt(request.getParameter("escolaridad"));
        String escalafon = request.getParameter("escalafon");
        String puntaje = request.getParameter("puntaje");
        int tipoDocente = Integer.parseInt(request.getParameter("tipoDocente"));
        
        usuario.setCodigo(codigo);
        usuario.setCorreo(correo);
        usuario.setContrasenia(contrasenia);
        usuario.setNombre(nombre);
        usuario.setApellido(apellido);
        usuario.setIdTipoDocumento(idTipoDocumento);
        usuario.setNumeroDocumento(numeroDocumento);
        usuario.setFechaNacimiento(fechaNacimiento);
        usuario.setDireccion(direccion);
        usuario.setTelefono(telefono);
        usuario.setTelefonoMovil(telefonoMovil);
        usuario.setIdTipoUsuario("3");
        
        docente.setEscalafon(escalafon);
        docente.setEscolaridad(""+escolaridad);
        docente.setPuntaje(puntaje);
        docente.setTipo(tipoDocente+"");
        
        boolean x = facade.registrarDocente(usuario,docente);
        
        if(x){
            System.out.println("registro!!!!");
            session.setAttribute("Mensaje", "Exito");
            response.sendRedirect("docente.jsp");
        }
    }
    else if(bot.equals("consultar")){
        
         String codigo = request.getParameter("codigo");
         
         String consulta = facade.consultarDocenteCodigo(codigo);
         //out.println("La consulta esssss:                    ......     "+consulta);
         
         session.setAttribute("codigo", "value="+ "\""+(String)consulta.split("-")[0]+ "\"");
         session.setAttribute("correo", "value="+ "\""+(String)consulta.split("-")[1]+ "\"");
         session.setAttribute("contrasenia", "value="+ "\""+(String)consulta.split("-")[2]+ "\"");
         session.setAttribute("contrasenia2", "value="+ "\""+(String)consulta.split("-")[2]+ "\"");
         session.setAttribute("nombre", "value="+ "\""+(String)consulta.split("-")[3]+ "\"");
         session.setAttribute("apellido", "value="+ "\""+(String)consulta.split("-")[4]+ "\"");
         session.setAttribute("tipoDocumento", "value="+ "\""+(String)consulta.split("-")[5]+ "\"");
         session.setAttribute("documento", "value="+ "\""+(String)consulta.split("-")[6]+ "\"");
         session.setAttribute("fechaNacimiento", "value="+ "\""+(String)consulta.split("-")[7]+ "\"");
         session.setAttribute("direccion", "value="+ "\""+(String)consulta.split("-")[8]+ "\"");
         session.setAttribute("telefono", "value="+ "\""+(String)consulta.split("-")[9]+ "\"");
         session.setAttribute("telefonoMovil", "value="+ "\""+(String)consulta.split("-")[10]+ "\"");
         
         session.setAttribute("escalafon", "value="+ "\""+(String)consulta.split("-")[11]+ "\"");
         session.setAttribute("puntaje", "value="+ "\""+(String)consulta.split("-")[12]+ "\"");
         
         session.setAttribute("Mensaje", "Éxito");
         response.sendRedirect("docente.jsp");
        
    }
    else if(bot.equals("actualizar")){
        
        String codigo = request.getParameter("codigo");   
        String correo = request.getParameter("correo");
        String contrasenia = request.getParameter("contrasenia");
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        int idTipoDocumento = Integer.parseInt(request.getParameter("idTipoDocumento"));
        String numeroDocumento = request.getParameter("numeroDocumento");
        String fechaNacimiento = request.getParameter("fechaNacimiento");
        String direccion = request.getParameter("direccion");
        String telefono = request.getParameter("telefono");
        String telefonoMovil = request.getParameter("telefonoMovil");
        
        int escolaridad = Integer.parseInt(request.getParameter("escolaridad"));
        String escalafon = request.getParameter("escalafon");
        String puntaje = request.getParameter("puntaje");
        int tipoDocente = Integer.parseInt(request.getParameter("tipoDocente"));
        
        usuario.setCodigo(codigo);
        usuario.setCorreo(correo);
        usuario.setContrasenia(contrasenia);
        usuario.setNombre(nombre);
        usuario.setApellido(apellido);
        usuario.setIdTipoDocumento(idTipoDocumento);
        usuario.setNumeroDocumento(numeroDocumento);
        usuario.setFechaNacimiento(fechaNacimiento);
        usuario.setDireccion(direccion);
        usuario.setTelefono(telefono);
        usuario.setTelefonoMovil(telefonoMovil);
        usuario.setIdTipoUsuario("3");
        
        docente.setEscalafon(escalafon);
        docente.setEscolaridad(""+escolaridad);
        docente.setPuntaje(puntaje);
        docente.setTipo(tipoDocente+"");
        
        int bandera = facade.actualizarDocente(usuario,docente);
        
        if(bandera==1){
            String consulta = facade.consultarDocenteCodigo(codigo);
         //out.println("La consulta esssss:                    ......     "+consulta);
         
            session.setAttribute("codigo", "value="+ "\""+(String)consulta.split("-")[0]+ "\"");
            session.setAttribute("correo", "value="+ "\""+(String)consulta.split("-")[1]+ "\"");
            session.setAttribute("contrasenia", "value="+ "\""+(String)consulta.split("-")[2]+ "\"");
            session.setAttribute("contrasenia2", "value="+ "\""+(String)consulta.split("-")[2]+ "\"");
            session.setAttribute("nombre", "value="+ "\""+(String)consulta.split("-")[3]+ "\"");
            session.setAttribute("apellido", "value="+ "\""+(String)consulta.split("-")[4]+ "\"");
            session.setAttribute("tipoDocumento", "value="+ "\""+(String)consulta.split("-")[5]+ "\"");
            session.setAttribute("documento", "value="+ "\""+(String)consulta.split("-")[6]+ "\"");
            session.setAttribute("fechaNacimiento", "value="+ "\""+(String)consulta.split("-")[7]+ "\"");
            session.setAttribute("direccion", "value="+ "\""+(String)consulta.split("-")[8]+ "\"");
            session.setAttribute("telefono", "value="+ "\""+(String)consulta.split("-")[9]+ "\"");
            session.setAttribute("telefonoMovil", "value="+ "\""+(String)consulta.split("-")[10]+ "\"");
         
            session.setAttribute("escalafon", "value="+ "\""+(String)consulta.split("-")[11]+ "\"");
            session.setAttribute("puntaje", "value="+ "\""+(String)consulta.split("-")[12]+ "\"");
         
            session.setAttribute("Mensaje", "Éxito");
            response.sendRedirect("docente.jsp");
        }
    }
    else if(bot.equals("eliminar")){
        //toca primero hacer los modulos, de modo que cuando se elimine se quite tambn de los modulos...
    }
    if(r==1){
        response.sendRedirect("administrarCoordinador.jsp");     
    }
    
     
%> 
