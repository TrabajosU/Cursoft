<%-- 
    Document   : administrarEstudiante
    Created on : Sep 28, 2014, 7:35:15 PM
    Author     : Megaterios
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="facade" class="com.cursoft.facade.Facade"></jsp:useBean>
<jsp:useBean id="usuario" class="com.cursoft.dto.UsuarioDto"></jsp:useBean>
<jsp:useBean id="aspirante" class="com.cursoft.dto.AspiranteDto"></jsp:useBean>
<jsp:useBean id="estudiante" class="com.cursoft.dto.EstudianteDto"></jsp:useBean>

<% 
    String val = (String)request.getParameter("requerimiento");


    if(val.equals("consultar")){
        
         out.println("consultar");
         String codigo = request.getParameter("codigo");
         String consulta = facade.realizarConsultaCodigo(codigo);
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
         
         session.setAttribute("promedio", "value="+ "\""+(String)consulta.split("-")[11]+ "\"");
         session.setAttribute("semestreTerminacionMaterias", "value="+ "\""+(String)consulta.split("-")[12]+ "\"");
         
         session.setAttribute("nota", "value="+ "\""+(String)consulta.split("-")[13]+ "\"");
         
         session.setAttribute("Mensaje", "Éxito");
         response.sendRedirect("estudiante.jsp");
         
        //out.println("consultar");
     }
    else if(val.equals("registrar")){
        
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
   
        String promedioPonderado = request.getParameter("promedioPonderado");
        String semestreFinalizacionMaterias = request.getParameter("semestreFinalizacionMaterias");
        //String reporteFinalizacionMaterias = request.getParameter("reporteFinalizacionMaterias");
        //String reportePazSalvo = request.getParameter("reportePazSalvo");
        //String reciboInscripcion = request.getParameter("reciboInscripcion");
        
        //String reciboPagoMatricula = request.getParameter("reciboPagoMatricula");
        int nota = Integer.parseInt(request.getParameter("nota"));
        
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
        usuario.setIdTipoUsuario("1");
        out.println(usuario.getTelefonoMovil());
        aspirante.setPromedioPonderado(promedioPonderado);
        aspirante.setSemestreFinalizacionMaterias(semestreFinalizacionMaterias);
        aspirante.setReporteFinalizacionMaterias("reporteFinalizacionMaterias");
        aspirante.setReportePazSalvo("reportePazSalvo");
        aspirante.setReciboInscripcion("reciboInscripcion");
        
        estudiante.setReciboPagoMatricula("reciboPagoMatricula");
        estudiante.setNota(nota);
        
        
        
        int bandera = facade.registrarEstudiante(usuario, aspirante, estudiante);
        
        if (bandera == 1) {
            session.setAttribute("Mensaje", "Éxito");
            response.sendRedirect("estudiante.jsp");
        }
        else if(bandera == 0) {
            session.setAttribute("Mensaje", "Error");
            response.sendRedirect("estudiante.jsp");
        }
        
        //out.println("registrar");
    }
     else if(val.equals("actualizar")){
         //var=3;
         out.println("actualizar");
     }
     else if(val.equals("eliminar")){
         //var=4;
         out.println("eliminar");
     }
%>