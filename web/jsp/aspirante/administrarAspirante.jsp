<%-- 
    Document   : administrarAspirante
    Created on : 12/10/2014, 10:59:23 PM
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
        String[] resul;

        if (req.equals("mostrarInicio")) {

            resp = facade.consultarAspiranteCorreo((String) sesionUsuario.getAttribute("usuario"));

            if (resp.isEmpty()) {
                session.setAttribute("Mensaje", "Datos incorrectos, verifica tu usuario y contraseña");
                response.sendRedirect("../usuario/iniciarSesion.jsp");
            }
            sesionUsuario.setAttribute("nombre", (String) resp.split(",,")[3]);
            sesionUsuario.setAttribute("apellido", (String) resp.split(",,")[4]);

            if (sesionUsuario.getAttribute("estadoUsuario").equals("A0")) {
                response.sendRedirect("inicioAspirantePendiente.jsp");
            }
            if (sesionUsuario.getAttribute("estadoUsuario").equals("A1")) {
                response.sendRedirect("inicioAspiranteAprobado.jsp");
            }
            if (sesionUsuario.getAttribute("estadoUsuario").equals("A2")) {
                response.sendRedirect("inicioAspiranteRechazado.jsp");
            }
        } else if (req.equals("consultarCorreo")) {

            try {
                resp = facade.consultarAspiranteCorreo((String) sesionUsuario.getAttribute("usuario"));
                resul = resp.split(",,");

                sesionUsuario.setAttribute("codigo", "value=" + "\"" + resul[0] + "\"");
                sesionUsuario.setAttribute("correo", "value=" + "\"" + resul[1] + "\"");
                sesionUsuario.setAttribute("contrasenia", "value=" + "\"" + resul[2] + "\"");
                sesionUsuario.setAttribute("contrasenia2", "value=" + "\"" + resul[2] + "\"");
                sesionUsuario.setAttribute("nombre", resul[3]);
                sesionUsuario.setAttribute("apellido", resul[4]);
                sesionUsuario.setAttribute("tipoDocumento", "value=" + "\"" + resul[5] + "\"");
                sesionUsuario.setAttribute("documento", "value=" + "\"" + resul[6] + "\"");
                sesionUsuario.setAttribute("fechaNacimiento", "value=" + "\"" + resul[7] + "\"");
                sesionUsuario.setAttribute("direccion", "value=" + "\"" + resul[8] + "\"");
                sesionUsuario.setAttribute("telefono", "value=" + "\"" + resul[9] + "\"");
                sesionUsuario.setAttribute("telefonoMovil", "value=" + "\"" + resul[10] + "\"");

                sesionUsuario.setAttribute("promedio", "value=" + "\"" + resul[11] + "\"");
                sesionUsuario.setAttribute("semestreTerminacionMaterias", "value=" + "\"" + resul[12] + "\"");

                sesionUsuario.setAttribute("reporteFinalizacionMaterias", resul[13]);
                sesionUsuario.setAttribute("reportePazSalvo", resul[14]);
                sesionUsuario.setAttribute("reciboInscripcion", resul[15]);
                sesionUsuario.setAttribute("reciboPagoMatricula", resul[16]);

                response.sendRedirect("aspirante.jsp");

            } catch (Exception e) {
                out.println("Error. Servidor no disponible");
                //response.sendRedirect("aspirante.jsp");
            }

        } else if (req.equals("consultar")) {

            resp = facade.consultarAspiranteCodigo(request.getParameter("codigo"));
            resul = resp.split(",,");

            sesionUsuario.setAttribute("codigo", "value=" + "\"" + resul[0] + "\"");
            sesionUsuario.setAttribute("correo", "value=" + "\"" + resul[1] + "\"");
            sesionUsuario.setAttribute("contrasenia", "value=" + "\"" + resul[2] + "\"");
            sesionUsuario.setAttribute("contrasenia2", "value=" + "\"" + resul[2] + "\"");
            sesionUsuario.setAttribute("nombre", resul[3]);
            sesionUsuario.setAttribute("apellido", resul[4]);
            sesionUsuario.setAttribute("tipoDocumento", "value=" + "\"" + resul[5] + "\"");
            sesionUsuario.setAttribute("documento", "value=" + "\"" + resul[6] + "\"");
            sesionUsuario.setAttribute("fechaNacimiento", "value=" + "\"" + resul[7] + "\"");
            sesionUsuario.setAttribute("direccion", "value=" + "\"" + resul[8] + "\"");
            sesionUsuario.setAttribute("telefono", "value=" + "\"" + resul[9] + "\"");
            sesionUsuario.setAttribute("telefonoMovil", "value=" + "\"" + resul[10] + "\"");

            sesionUsuario.setAttribute("promedio", "value=" + "\"" + resul[11] + "\"");
            sesionUsuario.setAttribute("semestreTerminacionMaterias", "value=" + "\"" + resul[12] + "\"");

            sesionUsuario.setAttribute("reporteFinalizacionMaterias", resul[13]);
            sesionUsuario.setAttribute("reportePazSalvo", resul[14]);
            sesionUsuario.setAttribute("reciboInscripcion", resul[15]);
            sesionUsuario.setAttribute("reciboPagoMatricula", resul[16]);

            response.sendRedirect("aspirante.jsp");

        }

    } else if (req.equals("registrarAspirante")) {

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
    } else {
        response.sendRedirect("../usuario/iniciarSesion.jsp");
    }


%>