<%-- 
    Document   : admininstrarDocente
    Created on : 22-oct-2014, 10:35:34
    Author     : Jhorman Perez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="facade" class="com.cursoft.facade.Facade"></jsp:useBean>
<jsp:useBean id="usuario" class="com.cursoft.dto.UsuarioDto"></jsp:useBean>
<jsp:useBean id="aspirante" class="com.cursoft.dto.AspiranteDto"></jsp:useBean>
<%@page session='true'%>


<%

    String req = request.getParameter("requerimiento");
    session.setAttribute("requerimiento", req);

    HttpSession sesionUsuario = request.getSession(true);

    if (!sesionUsuario.isNew() && sesionUsuario != null && sesionUsuario.getAttribute("usuario") != null) {

        String resp = "";
        String [] resul;

        if (req.equals("mostrarInicio")) {

            resp = facade.consultarDocenteCorreo((String) sesionUsuario.getAttribute("usuario"));
            
            if (resp.isEmpty()) {
                session.setAttribute("Mensaje", "Datos incorrectos, verifica tu usuario y contraseña");
                response.sendRedirect("../usuario/iniciarSesion.jsp");
            }
            resul = resp.split(",,");
            sesionUsuario.setAttribute("nombre", resul[3]);
            sesionUsuario.setAttribute("apellido", resul[4]);

            if (sesionUsuario.getAttribute("estadoUsuario").equals("D0")) {
                response.sendRedirect("inicioAdministrador.jsp");
            }
            if (sesionUsuario.getAttribute("estadoUsuario").equals("D1")) {
                response.sendRedirect("inicioProfesor.jsp");
            }
            if (sesionUsuario.getAttribute("estadoUsuario").equals("D2")) {
                response.sendRedirect("cargarCoordinador.jsp");
            }
            if (sesionUsuario.getAttribute("estadoUsuario").equals("D3")) {
                response.sendRedirect("inicioProfesorCoordinador.jsp");
            }
            if (sesionUsuario.getAttribute("estadoUsuario").equals("D4")) {
                response.sendRedirect("inicioAdministradorProfesor.jsp");
            }
            if (sesionUsuario.getAttribute("estadoUsuario").equals("D5")) {
                response.sendRedirect("inicioAdministradorCoordinador.jsp");
            }
            if (sesionUsuario.getAttribute("estadoUsuario").equals("D6")) {
                response.sendRedirect("inicioDocente.jsp");
            }

        } else if (req.equals("consultarDocenteCorreo")) {
            
            try{
                resp = facade.consultarDocenteCorreo((String) sesionUsuario.getAttribute("usuario"));         
                resul = resp.split(",,");
                
                session.setAttribute("codigo", "value=" + "\"" + (String) resp.split("-")[0] + "\"");
                session.setAttribute("correo", "value=" + "\"" + (String) resp.split("-")[1] + "\"");
                session.setAttribute("contrasenia", "value=" + "\"" + (String) resp.split("-")[2] + "\"");
                session.setAttribute("contrasenia2", "value=" + "\"" + (String) resp.split("-")[2] + "\"");
                session.setAttribute("nombre", "value=" + "\"" + (String) resp.split("-")[3] + "\"");
                session.setAttribute("apellido", "value=" + "\"" + (String) resp.split("-")[4] + "\"");
                session.setAttribute("tipoDocumento", "value=" + "\"" + (String) resp.split("-")[5] + "\"");
                session.setAttribute("documento", "value=" + "\"" + (String) resp.split("-")[6] + "\"");
                session.setAttribute("fechaNacimiento", "value=" + "\"" + (String) resp.split("-")[7] + "\"");
                session.setAttribute("direccion", "value=" + "\"" + (String) resp.split("-")[8] + "\"");
                session.setAttribute("telefono", "value=" + "\"" + (String) resp.split("-")[9] + "\"");
                session.setAttribute("telefonoMovil", "value=" + "\"" + (String) resp.split("-")[10] + "\"");

                session.setAttribute("escalafon", "value=" + "\"" + (String) resp.split("-")[11] + "\"");
                session.setAttribute("puntaje", "value=" + "\"" + (String) resp.split("-")[12] + "\"");

                session.setAttribute("Mensaje", "Éxito");
                response.sendRedirect("docente.jsp");
                
            }catch(Exception e){
                out.println("Error. Servidor no disponible");
            }

        }
        /*
         else if (req.equals("consultarCorreo")) {

         try {
         resp = facade.consultarAspiranteCorreo((String) sesionUsuario.getAttribute("usuario"));

         sesionUsuario.setAttribute("codigo", "value=" + "\"" + (String) resp.split("-")[0] + "\"");
         sesionUsuario.setAttribute("correo", "value=" + "\"" + (String) resp.split("-")[1] + "\"");
         sesionUsuario.setAttribute("contrasenia", "value=" + "\"" + (String) resp.split("-")[2] + "\"");
         sesionUsuario.setAttribute("contrasenia2", "value=" + "\"" + (String) resp.split("-")[2] + "\"");
         sesionUsuario.setAttribute("nombre", (String) resp.split("-")[3]);
         sesionUsuario.setAttribute("apellido", (String) resp.split("-")[4]);
         sesionUsuario.setAttribute("tipoDocumento", "value=" + "\"" + (String) resp.split("-")[5] + "\"");
         sesionUsuario.setAttribute("documento", "value=" + "\"" + (String) resp.split("-")[6] + "\"");
         sesionUsuario.setAttribute("fechaNacimiento", "value=" + "\"" + (String) resp.split("-")[7] + "\"");
         sesionUsuario.setAttribute("direccion", "value=" + "\"" + (String) resp.split("-")[8] + "\"");
         sesionUsuario.setAttribute("telefono", "value=" + "\"" + (String) resp.split("-")[9] + "\"");
         sesionUsuario.setAttribute("telefonoMovil", "value=" + "\"" + (String) resp.split("-")[10] + "\"");

         sesionUsuario.setAttribute("promedio", "value=" + "\"" + (String) resp.split("-")[11] + "\"");
         sesionUsuario.setAttribute("semestreTerminacionMaterias", "value=" + "\"" + (String) resp.split("-")[12] + "\"");

         response.sendRedirect("aspirante.jsp");

         }catch(Exception e){
         out.println("Error. Servidor no disponible");
         //response.sendRedirect("aspirante.jsp");
         }

         } else if (req.equals("consultar")) {

         resp = facade.consultarAspiranteCodigo(request.getParameter("codigo"));

         sesionUsuario.setAttribute("codigo", "value=" + "\"" + (String) resp.split("-")[0] + "\"");
         sesionUsuario.setAttribute("correo", "value=" + "\"" + (String) resp.split("-")[1] + "\"");
         sesionUsuario.setAttribute("contrasenia", "value=" + "\"" + (String) resp.split("-")[2] + "\"");
         sesionUsuario.setAttribute("contrasenia2", "value=" + "\"" + (String) resp.split("-")[2] + "\"");
         sesionUsuario.setAttribute("nombre", (String) resp.split("-")[3]);
         sesionUsuario.setAttribute("apellido", (String) resp.split("-")[4]);
         sesionUsuario.setAttribute("tipoDocumento", "value=" + "\"" + (String) resp.split("-")[5] + "\"");
         sesionUsuario.setAttribute("documento", "value=" + "\"" + (String) resp.split("-")[6] + "\"");
         sesionUsuario.setAttribute("fechaNacimiento", "value=" + "\"" + (String) resp.split("-")[7] + "\"");
         sesionUsuario.setAttribute("direccion", "value=" + "\"" + (String) resp.split("-")[8] + "\"");
         sesionUsuario.setAttribute("telefono", "value=" + "\"" + (String) resp.split("-")[9] + "\"");
         sesionUsuario.setAttribute("telefonoMovil", "value=" + "\"" + (String) resp.split("-")[10] + "\"");

         sesionUsuario.setAttribute("promedio", "value=" + "\"" + (String) resp.split("-")[11] + "\"");
         sesionUsuario.setAttribute("semestreTerminacionMaterias", "value=" + "\"" + (String) resp.split("-")[12] + "\"");

         response.sendRedirect("aspirante.jsp");

         }
         */
    } /*else if (req.equals("registrarAspirante")) {

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
     usuario.setIdTipoUsuario(((byte) 1));
     //out.println(usuario.getTelefonoMovil());
     aspirante.setPromedioPonderado(promedioPonderado);
     aspirante.setSemestreFinalizacionMaterias(semestreFinalizacionMaterias);
     aspirante.setReporteFinalizacionMaterias("reporteFinalizacionMaterias");
     aspirante.setReportePazSalvo("reportePazSalvo");
     aspirante.setReciboInscripcion("reciboInscripcion");

     int resul = facade.registrarAspirante(usuario, aspirante);

     if (resul == 1) {
     session.setAttribute("Mensaje", "¡Su registro ha sido exitoso! Ingrese sus datos para iniciar sesión");
     } else if (resul == 0) {
     session.setAttribute("Mensaje", "Error");
     }

     response.sendRedirect("../usuario/iniciarSesion.jsp");

     } else if (req.equals("mostrarRegistrarAspirante")) {
     session.setAttribute("Mensaje", "");
     response.sendRedirect("registrarAspirante.jsp");
            
     }*/ else {
        response.sendRedirect("../usuario/iniciarSesion.jsp");
    }


%>