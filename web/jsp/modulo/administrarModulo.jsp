<%-- 
    Document   : administrarModulo
    Created on : 24-oct-2014, 19:18:33
    Author     : Jhorman Perez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="facade" class="com.cursoft.facade.Facade"></jsp:useBean>
<jsp:useBean id="usuario" class="com.cursoft.dto.UsuarioDto"></jsp:useBean>
<jsp:useBean id="aspirante" class="com.cursoft.dto.AspiranteDto"></jsp:useBean>
<jsp:useBean id="estudiante" class="com.cursoft.dto.EstudianteDto"></jsp:useBean>
<jsp:useBean id="docente" class="com.cursoft.dto.DocenteDto"></jsp:useBean>
<jsp:useBean id="moduloDto" class="com.cursoft.dto.ModuloDto"></jsp:useBean>

<%
    String req = request.getParameter("requerimiento");
    session.setAttribute("requerimiento", req);

    HttpSession sesionUsuario = request.getSession(true);

    if (!sesionUsuario.isNew() && sesionUsuario != null && sesionUsuario.getAttribute("usuario") != null) {

        String resp = "", tipo = "";
        String[] resul;

        if (req.equals("matricularModuloEstudiante")) {
            System.out.println("ARROZ:\n" + req);
            resp = facade.listarModulos();
            String[] mods = resp.split(";");
            String m = "";
            for (int i = 0; i < mods.length; i++) {
                String[] modulo = mods[i].split(",,");
                moduloDto.setNombre(modulo[0]);
                String idMod = facade.obtenerIdModulo(moduloDto);

                if (modulo[1].equals("1")) {
                    tipo = "Semestral";
                } else if (modulo[1].equals("2")) {
                    tipo = "Acompañamiento";
                }
                m += "<tr>" + "<td>" + modulo[0] + "</td>" + "<td>" + tipo + "</td>" + "<td>" + modulo[2] + "</td>"
                        + "<td>" + "<form action=\"administrarModulo.jsp\"class=\"form-horizontal\""
                        + "method=\"post\" role=\"form\">" + "<div class=\"col-xs-12 col-sm-2 col-md-10\">"
                        + "</select>" + "</div>" + "</td>"
                        + "<td>"
                        + "<div class=\"form-group\">"
                        + "<div class=\"row\">"
                        + "<div class=\"col-xs-offset-0 col-xs-6 text-center\">"
                        + "<input type=\"hidden\" name=\"idModulo\" value=\"" + idMod + "\">"
                        + "<button class=\"btn btn-danger\" id=\"guardar\" name=\"requerimiento\""
                        + "value=\"efectuarMatriculaEstudiante\" type=\"submit\">" + "Matricular" + "</button>"
                        + "</div>"
                        + "</div>"
                        + "</div>"
                        + "</form>"
                        + "</td>" + "</tr>";
            }

            session.setAttribute("modulos", m);
            //System.out.println(resp);
            response.sendRedirect("matricularModuloEstudiante.jsp");

        } else if (req.equals("efectuarMatriculaEstudiante")) {

        }

    } else {
        response.sendRedirect("../usuario/iniciarSesion.jsp");
    }
%>