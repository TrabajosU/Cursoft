<%-- 
    Document   : administrarAspirante
    Created on : 12/10/2014, 10:59:23 PM
    Author     : Jhorman Perez
--%>

<%--<%@page import = "com.cursoft.facade.Facade"%>--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="facade" class="com.cursoft.facade.Facade"></jsp:useBean>
<jsp:useBean id="usuario" class="com.cursoft.dto.UsuarioDto"></jsp:useBean>
<jsp:useBean id="aspirante" class="com.cursoft.dto.AspiranteDto"></jsp:useBean>
<%@page session='true'%>

<%--
<jsp:useBean id="facade">
    <jsp:attribute name="class" trim="true">com.cursoft.facade.Facade</jsp:attribute>
</jsp:useBean>
--%>

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
                session.setAttribute("Mensaje", "Datos incorrectos, verifique su usuario y contraseña");
                response.sendRedirect("../usuario/iniciarSesion.jsp");
            }
            //sesionUsuario.setAttribute("cargaMatricula", "");
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
                
                System.out.println("SOY RESUL: "+resp);
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

        } else if (req.equals("actualizar")) {

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
            //int nota = Integer.parseInt(request.getParameter("nota"));
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
            //aspirante.setReporteFinalizacionMaterias("reporteFinalizacionMaterias");
            //aspirante.setReportePazSalvo("reportePazSalvo");
            //aspirante.setReciboInscripcion("reciboInscripcion");

            int bandera = facade.actualizarAspirante(usuario, aspirante);

            if (bandera == 1) {
                sesionUsuario.setAttribute("Mensaje", "Los datos han sido actualizados exitosamente.");
            } else if (bandera == 0) {
                sesionUsuario.setAttribute("Mensaje", "Error");
            }
            response.sendRedirect("administrarAspirante.jsp?requerimiento=consultarCorreo");

        } else if (req.equals("cargarPagoMatricula")) {

            System.out.println("HA LLEGADO1");
            try {
                /*
                 }
                 File file;
                 int maxFileSize = 5000 * 1024;
                 int maxMemSize = 5000 * 1024;
                 ServletContext context = pageContext.getServletContext();
                 String filePath = context.getInitParameter("file-upload");

                 // Verify the content type
                 String contentType = request.getContentType();
                 if ((contentType.indexOf("multipart/form-data") >= 0)) {

                 DiskFileItemFactory factory = new DiskFileItemFactory();
                 // maximum size that will be stored in memory
                 factory.setSizeThreshold(maxMemSize);
                 // Location to save data that is larger than maxMemSize.
                 factory.setRepository(new File("c:\\temp"));

                 // Create a new file upload handler
                 ServletFileUpload upload = new ServletFileUpload(factory);
                 // maximum file size to be uploaded.
                 upload.setSizeMax(maxFileSize);
                 //try {
                 // Parse the request to get file items.
                 System.out.println("HA LLEGADO");
                 List fileItems = upload.parseRequest(request);

                 // Process the uploaded file items
                 Iterator i = fileItems.iterator();

                 String reciboPagoMatricula = "http://sandbox1.ufps.edu.co/~ufps_3/ArchivosCursoft/";
                    
                 while (i.hasNext()) {
                 FileItem fi = (FileItem) i.next();
                 if (!fi.isFormField()) {
                 // Get the uploaded file parameters
                 String fieldName = fi.getFieldName();
                 String fileName = fi.getName();
                 boolean isInMemory = fi.isInMemory();
                 long sizeInBytes = fi.getSize();
                 // Write the file
                 if (fileName.lastIndexOf("\\") >= 0) {
                 file = new File(filePath
                 + fileName.substring(fileName.lastIndexOf("\\")));
                 } else {
                 file = new File(filePath
                 + fileName.substring(fileName.lastIndexOf("\\") + 1));
                 }
                 fi.write(file);
                 /*
                 out.println("Uploaded Filename: " + filePath
                 + fileName + "<br>");
                            
                 reciboPagoMatricula += fileName;
                 }
                 }
                 */

                String reciboPagoMatricula = "http://sandbox1.ufps.edu.co/~ufps_3/ArchivosCursoft/pagomatricula.png";
                String idAspirante = facade.obtenerIdAspirante((String) sesionUsuario.getAttribute("usuario"));
                
                System.out.println("consultaba id aspirante");
                boolean registro = facade.cargarPagoMatricula(idAspirante, reciboPagoMatricula);
                if (registro) {
                    sesionUsuario.setAttribute("cargaMatricula", "El recibo de pago de matrícula ha sido"
                            + " cargado exitosamente");
                } else {
                    sesionUsuario.setAttribute("cargaMatricula", "Ha ocurrido un error al intentar cargar"
                            + " el recibo de pago de matrícula");
                }

                /*
                 String idAspirante = facade.obtenerIdAspirante((String) sesionUsuario.getAttribute("usuario"));
                 String reciboPagoMatricula = "";
                 String ubicacionArchivoServer = "http://sandbox1.ufps.edu.co/~ufps_3/ArchivosCursoft/";

                 DiskFileItemFactory factory = new DiskFileItemFactory();
                 factory.setSizeThreshold(1024);
                 factory.setRepository(new File(ubicacionArchivoServer));

                 ServletFileUpload upload = new ServletFileUpload(factory);

                 List<FileItem> partes = upload.parseRequest(request);

                 for (FileItem item : partes) {
                 File file = new File(ubicacionArchivoServer, item.getName());
                 item.write(file);
                 }
                
                 reciboPagoMatricula = "http://sandbox1.ufps.edu.co/~ufps_3/ArchivosCursoft/";
                 boolean registro = facade.cargarPagoMatricula(idAspirante, reciboPagoMatricula);
                
                 out.write("El archivo se a subido correctamente");
                 /*
                 String idAspirante = facade.obtenerIdAspirante((String) sesionUsuario.getAttribute("usuario"));                
                 MultipartRequest m = new MultipartRequest(request, "http://sandbox1.ufps.edu.co/~ufps_3/ArchivosCursoft/");
                                                
                 if(registro){
                 sesionUsuario.setAttribute("cargaMatricula", "El recibo de pago de matrícula ha sido"
                 + " cargado exitosamente");
                 }
                 else{
                 sesionUsuario.setAttribute("cargaMatricula", "Ha ocurrido un error al intentar cargar"
                 + " el recibo de pago de matrícula");
                 }
                 */
                response.sendRedirect("administrarAspirante.jsp?requerimiento=mostrarInicio");

            } catch (Exception ex) {
                sesionUsuario.setAttribute("cargaMatricula", "Ha ocurrido un error al intentar cargar"
                        + " el recibo de pago de matrícula");
                response.sendRedirect("administrarAspirante.jsp?requerimiento=mostrarInicio");
                //out.write("Error al subir archivo " + ex.getMessage());
            }

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

        String reporteFinalizacionMaterias = "http://sandbox1.ufps.edu.co/~ufps_3/ArchivosCursoft/reportefinmaterias.png";
        String reportePazSalvo = "http://sandbox1.ufps.edu.co/~ufps_3/ArchivosCursoft/pazysalvo.png";
        String reciboInscripcion = "http://sandbox1.ufps.edu.co/~ufps_3/ArchivosCursoft/inscripcion.png";

        usuario.setCodigo(codigo);
        usuario.setCorreo(correo);
        usuario.setContrasenia(contrasenia);
        usuario.setNombre(nombre);
        usuario.setApellido(apellido);
        usuario.setIdTipoDocumento(idTipoDocumento);
        usuario.setNumeroDocumento(numeroDocumento);
        usuario.setFechaNacimiento(fechaNacimiento.replace("-", "/"));
        usuario.setDireccion(direccion);
        usuario.setTelefono(telefono);
        usuario.setTelefonoMovil(telefonoMovil);
        usuario.setIdTipoUsuario(((byte) 1));
        //out.println(usuario.getTelefonoMovil());
        aspirante.setPromedioPonderado(promedioPonderado);
        aspirante.setSemestreFinalizacionMaterias(semestreFinalizacionMaterias);
        aspirante.setReporteFinalizacionMaterias(reporteFinalizacionMaterias);
        aspirante.setReportePazSalvo(reportePazSalvo);
        aspirante.setReciboInscripcion(reciboInscripcion);

        int reg = facade.registrarAspirante(usuario, aspirante);

        if (reg == 1) {
            session.setAttribute("Mensaje", "<div class=\"text-center\">¡Su registro ha sido exitoso! Ingrese sus datos para iniciar sesión.</div>");
        } else if (reg == 0) {
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