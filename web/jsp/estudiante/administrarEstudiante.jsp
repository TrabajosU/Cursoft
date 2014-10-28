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
<jsp:useBean id="moduloDto" class="com.cursoft.dto.ModuloDto"></jsp:useBean>

<%

    String val = (String) request.getParameter("requerimiento");

    HttpSession sesionUsuario = request.getSession(true);

    if (sesionUsuario.isNew()) {
        response.sendRedirect("../usuario/iniciarSesion.jsp");
        return;
    }
    if (sesionUsuario == null || sesionUsuario.getAttribute("usuario") == null) {
        response.sendRedirect("../usuario/iniciarSesion.jsp");
        return;
    }

    String resp = "";
    String[] resul;

    if (val.equals("mostrarInicio")) {

        resp = facade.consultarEstudianteCorreo((String) sesionUsuario.getAttribute("usuario"));
        resul = resp.split(",,");

        sesionUsuario.setAttribute("nombre", resul[3]);
        sesionUsuario.setAttribute("apellido", resul[4]);

        if (sesionUsuario.getAttribute("estadoUsuario").equals("E0")) {
            response.sendRedirect("inicioEstudiantePendiente.jsp");
        }
        if (sesionUsuario.getAttribute("estadoUsuario").equals("E1")) {

            String idEstudiante = facade.obtenerIdEstudiante((String) sesionUsuario.getAttribute("usuario"));

            String m = "", tipo = "";

            resp = facade.listarModulosMatriculados(idEstudiante);

            String tabla = "<div class=\"table-responsive\">"
                    + "<table class=\"table table-hover\">"
                    + "<thead>"
                    + "<tr>"
                    + "<th>Nombre</th>"
                    + "<th>Tipo</th>"
                    + "<th>Profesor</th>"
                    + "<th>Nota</th>"
                    + "</tr>"
                    + "</thead>"
                    + "<tbody>";

            if (!resp.isEmpty()) {
                String[] mods = resp.split(";");
                for (int i = 0; i < mods.length; i++) {
                    String[] modulo = mods[i].split(",,");
                    
                    if (modulo[1].equals("1")) {
                        tipo = "Semestral";
                    } else if (modulo[1].equals("2")) {
                        tipo = "Acompañamiento";
                    }
                    m += "<tr>" + "<td>" + modulo[0] + "</td>" + "<td>" + tipo + "</td>" + "<td>" + modulo[2] + "</td>"
                            + "<td>" + modulo[3]
                            + "</td>" + "</tr>";
                }

                tabla += m
                        + "</tbody>"
                        + "</table>"
                        + "</div>";

            } else {
                tabla = "<div class=\"text-center\">No hay módulos matriculados.</div>";
            }
            sesionUsuario.setAttribute("modulos", tabla);

            response.sendRedirect("inicioEstudianteAprobado.jsp");
        }
        if (sesionUsuario.getAttribute("estadoUsuario").equals("E2")) {
            response.sendRedirect("inicioEstudianteRechazado.jsp");
        }
        if (sesionUsuario.getAttribute("estadoUsuario").equals("E3")) {
            response.sendRedirect("inicioEstudianteGraduado.jsp");
        }
    } else if (val.equals("consultarCorreo")) {

        resp = facade.consultarEstudianteCorreo((String) sesionUsuario.getAttribute("usuario"));

        resul = resp.split(",,");

        session.setAttribute("codigo", resul[0]);
        session.setAttribute("correo", resul[1]);
        session.setAttribute("contrasenia", resul[2]);
        session.setAttribute("contrasenia2", resul[2]);
        session.setAttribute("nombre", resul[3]);
        session.setAttribute("apellido", resul[4]);
        session.setAttribute("tipoDocumento", resul[5]);
        session.setAttribute("documento", resul[6]);
        session.setAttribute("fechaNacimiento", resul[7]);
        session.setAttribute("direccion", resul[8]);
        session.setAttribute("telefono", resul[9]);
        session.setAttribute("telefonoMovil", resul[10]);
        session.setAttribute("promedio", resul[11]);
        session.setAttribute("semestreTerminacionMaterias", resul[12]);
        session.setAttribute("reporteFinalizacionMaterias", resul[13]);
        session.setAttribute("reportePazSalvo", resul[14]);
        session.setAttribute("reciboInscripcion", resul[15]);
        session.setAttribute("reciboPagoMatricula", resul[16]);

        String actualizarButton = "<div class=\"form-group\">"
                + "<div class=\"row\">"
                + "<div class=\"col-xs-offset-4 col-xs-4 text-center\">"
                + "<button class=\"btn btn-danger\" id=\"cancelar\" name=\"requerimiento\""
                + "value=\"actualizar\" type=\"submit\">Actualizar</button>"
                + "</div>"
                + "</div>"
                + "</div>";

        String registrarButton = "<div class=\"form-group\">"
                + "<div class=\"row\">"
                + "<div class=\"col-xs-offset-4 col-xs-4 text-center\">"
                + "<button class=\"btn btn-danger\" id=\"cancelar\" name=\"requerimiento\""
                + "value=\"registrar\" type=\"submit\">Registrar</button>"
                + "</div>"
                + "</div>"
                + "</div>";

        String eliminarButton = "<div class=\"form-group\">"
                + "<div class=\"row\">"
                + "<div class=\"col-xs-offset-4 col-xs-4 text-center\">"
                + "<button class=\"btn btn-danger\" id=\"cancelar\" name=\"requerimiento\""
                + "value=\"eliminar\" type=\"submit\">Eliminar</button>"
                + "</div>"
                + "</div>"
                + "</div>";

        String consultarButton = "<div class=\"form-group\">"
                + "<div class=\"row\">"
                + "<div class=\"col-xs-offset-4 col-xs-4 text-center\">"
                + "<button class=\"btn btn-danger\" id=\"cancelar\" name=\"requerimiento\""
                + "value=\"consultar\" type=\"submit\">Consultar</button>"
                + "</div>"
                + "</div>"
                + "</div>";

        session.setAttribute("actualizar", actualizarButton);
        session.setAttribute("registrar", "");
        session.setAttribute("eliminar", "");
        session.setAttribute("consultar", "");

        out.print("SOY RECIBO INSC: " + session.getAttribute("reciboInscripcion"));
        response.sendRedirect("estudiante.jsp");

    } else if (val.equals("consultar")) {

        resp = facade.consultarEstudianteCodigo(request.getParameter("codigo"));

        resul = resp.split(",,");

        session.setAttribute("codigo", resul[0]);
        session.setAttribute("correo", resul[1]);
        session.setAttribute("contrasenia", resul[2]);
        session.setAttribute("contrasenia2", resul[2]);
        session.setAttribute("nombre", resul[3]);
        session.setAttribute("apellido", resul[4]);
        session.setAttribute("tipoDocumento", resul[5]);
        session.setAttribute("documento", resul[6]);
        session.setAttribute("fechaNacimiento", resul[7]);
        session.setAttribute("direccion", resul[8]);
        session.setAttribute("telefono", resul[9]);
        session.setAttribute("telefonoMovil", resul[10]);

        session.setAttribute("promedio", resul[11]);
        session.setAttribute("semestreTerminacionMaterias", resul[12]);

        session.setAttribute("nota", resul[13]);

        response.sendRedirect("estudiante.jsp");

    } else if (val.equals("actualizar")) {
        //var=3;
        System.out.println("actualizar");

        String codigo = request.getParameter("codigo");
        String correo = request.getParameter("correo");
        String contrasenia = request.getParameter("contrasenia");
        String contrasenia2 = request.getParameter("confirmarContrasenia");
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
        /*
         if(codigo.isEmpty() || correo.isEmpty() || contrasenia.isEmpty() || contrasenia2.isEmpty() || nombre.isEmpty() || apellido.isEmpty()
         || numeroDocumento.isEmpty() || fechaNacimiento.isEmpty() || direccion.isEmpty() || telefono.isEmpty() || telefonoMovil.isEmpty()
         || promedioPonderado.isEmpty() || semestreFinalizacionMaterias.isEmpty()){
            
         session.setAttribute("Mensaje", "Verifique los campos");
         response.sendRedirect("estudiante.jsp");
         }
         else{
        
         */
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

        estudiante.setReciboPagoMatricula("reciboPagoMatricula");
        estudiante.setNota(nota);

        System.out.println("Se fueeeee a actualizaaarrrrrrr");
        int bandera = facade.actualizarEstudiante(usuario, aspirante, estudiante);
        System.out.println(" actualizaaarrrrrrr");
        if (bandera == 1) {

            String consulta = facade.consultarEstudianteCodigo(codigo);
            out.println("La consulta esssss:                    ......     " + consulta);

            session.setAttribute("codigo", (String) consulta.split(",,")[0] + "\" disabled");
            session.setAttribute("correo", (String) consulta.split(",,")[1]);
            session.setAttribute("contrasenia", (String) consulta.split(",,")[2]);
            session.setAttribute("contrasenia2", (String) consulta.split(",,")[2]);
            session.setAttribute("nombre", (String) consulta.split(",,")[3]);
            session.setAttribute("apellido", (String) consulta.split(",,")[4]);
            session.setAttribute("tipoDocumento", (String) consulta.split(",,")[5]);
            session.setAttribute("documento", (String) consulta.split(",,")[6]);
            session.setAttribute("fechaNacimiento", (String) consulta.split(",,")[7]);
            session.setAttribute("direccion", (String) consulta.split(",,")[8]);
            session.setAttribute("telefono", (String) consulta.split(",,")[9]);
            session.setAttribute("telefonoMovil", (String) consulta.split(",,")[10]);

            session.setAttribute("promedio", (String) consulta.split(",,")[11]);
            session.setAttribute("semestreTerminacionMaterias", (String) consulta.split(",,")[12]);

            session.setAttribute("nota", (String) consulta.split(",,")[13]);

            session.setAttribute("Mensaje", "Éxito");
            response.sendRedirect("estudiante.jsp");
        } else if (bandera == 0) {
            session.setAttribute("Mensaje", "Error");
            response.sendRedirect("estudiante.jsp");
        }
        //}

    } else if (val.equals("eliminar")) {
        //var=4;
        out.println("eliminar");

        String codigo = request.getParameter("codigo");
        usuario.setCodigo(codigo);

        String respuesta = facade.eliminarEstudiante(usuario);

        if (!respuesta.isEmpty()) {
            session.setAttribute("Mensaje", "Procedimiento exitoso. Información del"
                    + " estudiante eliminado del sistema:\n"
                    + respuesta.split(",,")[0] + " " + respuesta.split(",,")[1] + " " + respuesta.split(",,")[2]);
        } else {
            session.setAttribute("Mensaje", "Error");
        }

        response.sendRedirect("estudiante.jsp");

    } else if (val.equals("cancelar")) {
        response.sendRedirect("administrarEstudiante.jsp?requerimiento=mostrarInicio");
    }
%>
