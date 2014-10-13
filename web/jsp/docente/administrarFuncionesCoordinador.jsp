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
<jsp:useBean id="modulo" class="com.cursoft.dto.ModuloDto"></jsp:useBean>

<%
    String bot = request.getParameter("requerimiento");
    System.out.println("llego a funciones");
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
        
    
        response.sendRedirect("administrarCoordinador.jsp");     
    
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
        
    
        response.sendRedirect("administrarCoordinador.jsp");     
    
    }
    
    else if(bot.equals("registrarDocente")){
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
        usuario.setIdTipoUsuario(((byte)2));
        
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
    
    else if(bot.equals("consultarDocente")){
        
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
    
    else if(bot.equals("actualizarDocente")){
        
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
        usuario.setIdTipoUsuario(((byte)2));
        
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
    
    else if(bot.equals("eliminarDocente")){
        //toca primero hacer los modulos, de modo que cuando se elimine se quite tambn de los modulos...
    }
    
    else if(bot.equals("cancelarDocente")){
        response.sendRedirect("docente.jsp");
    }
    
    else if(bot.equals("registrarModulo")){
        String nombre = request.getParameter("nombre");
        String horas = request.getParameter("horas");
        int tipo = Integer.parseInt(request.getParameter("tipo").toString());
        String fechaInicio = request.getParameter("fechaInicio");
        int prof = Integer.parseInt(request.getParameter("profesor"));
        if(session.getAttribute("horario")!=null){
            String horario = session.getAttribute("horario").toString();
            String [] profes = session.getAttribute("profesores").toString().split(";");
            String [] profesor = profes[prof].split("-");
            String codigoProfe = profesor[0];
            
            modulo.setNombre(nombre);
            modulo.setHoras(horas);
            modulo.setTipo(""+tipo);
            modulo.setFechaInicio(fechaInicio);
            
            usuario.setCodigo(codigoProfe);
            
            boolean x = facade.registrarModulo(modulo,usuario,horario);
            
            if(x){
                session.setAttribute("Mensaje", "Registro Exitoso");
                response.sendRedirect("../modulo/cargarProfesores.jsp");
            }
        }
        else{
           response.sendRedirect("docente.jsp"); 
        }
    }
    else if(bot.equals("horarioBtn")){
        System.out.println("llego a horariobtn");
        response.sendRedirect("../modulo/horario.jsp");
    }
    else if(bot.equals("consultarModulo")){
        String nombre = request.getParameter("nombre");
        modulo.setNombre(nombre);
        String consulta = facade.consultarModulo(modulo);
        
        session.setAttribute("nombre", "value="+ "\""+modulo.getNombre()+ "\"");
        session.setAttribute("horas", "value="+ "\""+modulo.getHoras()+ "\"");
        session.setAttribute("fechaInicio", "value="+ "\""+modulo.getFechaInicio()+ "\"");
        System.out.println("la consulta es: "+consulta);
        String horarios = consulta.split("::")[0];
        
        System.out.println("los horarios son: "+horarios);
        String profesores = consulta.split("::")[1];
        System.out.println("Los profesores son: "+profesores);
        
        session.setAttribute("horario", "value="+ "\""+horarios+"\" disabled");
        session.setAttribute("profesores", profesores);
        
        session.setAttribute("Mensaje", "Consulta Exitosa");
        
        response.sendRedirect("../modulo/modulo.jsp");
    }
    
    
    
     
%> 
