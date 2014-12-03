<%-- 
    Document   : listadoAspirantes
    Created on : 18/10/2014, 10:39:56 AM
    Author     : Manuel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <!--Codificación de caracteres-->
        <meta charset="utf-8">
        <!--Titulo-->
        <title>CURSOFT - Sistema de Información</title>
        <!--Visualización-->
        <meta content="width=device-width, heigth=device-height, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <!--Información-->
        <meta content="CURSOFT - Sistema de información para la administración de curso de profundización" name="description">
        <meta content="Megaterios" name="author">
        <meta content="index, follow" name="robots">
        <!--Normalizar estilos-->
        <link href="../../css/normalize.css" rel="stylesheet">
        <!--Bootstrap-->
        <link href="../../css/bootstrap.css" rel="stylesheet">
        <link href="../../css/bootstrap-theme.css" rel="stylesheet">
        <link href="../../css/bootstrap-formhelpers.css" rel="stylesheet">
        <!--Hojas de estilo-->
        <link href="../../css/style.css" rel="stylesheet">
        <!-- Core CSS - Include with every page -->
        <link href="../../css/bootstrap.min.css" rel="stylesheet">
        <link href="../../font-awesome/css/font-awesome.css" rel="stylesheet">
        <!-- Page-Level Plugin CSS - Dashboard -->
        <link href="../../css/plugins/morris/morris-0.4.3.min.css" rel="stylesheet">
        <link href="../../css/plugins/timeline/timeline.css" rel="stylesheet">
        <!-- SB Admin CSS - Include with every page -->
        <link href="../../css/sb-admin.css" rel="stylesheet">
        <!--Iconos-->
        <link href="../../img/favicon.ico" rel="shortcut icon">
    </head>

    <body>
        <div class="container">
            <header>
                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" id="contenido">
                        <figure>
                            <img alt="CURSOFT" class="img-responsive" id="banner_cursoft" src="../../img/banne_cursoft.png">
                        </figure>
                    </div>
                </div>
            </header>
            <br>
            <section>
                <div class="row">
                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3" id="menu">
                        <div class="navbar-default navbar-static-side" role="navigation">
                            <div class="sidebar-collapse">
                                <ul class="nav" id="side-menu">
                                    <li>
                                        <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> Administrar<span class="fa arrow"></span></a>
                                        <ul class="nav nav-second-level">
                                            <li>
                                                <a href="../aspirante/aspiranteCoordinador.jsp">Aspirante</a>
                                            </li>
                                            <li>
                                                <a href="../estudiante/estudiante.jsp">Estudiante</a>
                                            </li>
                                            <li>
                                                <a href="../docente/docente.jsp">Docente</a>
                                            </li>
                                            <li>
                                                <a href="../modulo/cargarProfesores.jsp">Modulo</a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li>
                                        <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> Consultar Listados<span class="fa arrow"></span></a>
                                        <ul class="nav nav-second-level">
                                            <li>
                                                <a href="../aspirante/cargarListadoAspirantes.jsp">Listar Aspirantes</a>
                                            </li>
                                            <li>
                                                <a href="../estudiante/cargarListadoEstudiantes.jsp">Listar Estudiantes</a>
                                            </li>
                                            <li>
                                                <a href="../docente/cargarListadoDocentes.jsp">Listar Docentes</a>
                                            </li>
                                            <li>
                                                <a href="../modulo/cargarListadoModulos.jsp">Listar Modulos</a>
                                            </li>
                                        </ul>
                                    </li>

                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-9 col-md-9 col-lg-9" id="contenido">
                        <div class="text-right">
                            <% out.print(session.getAttribute("nombre") + " " + session.getAttribute("apellido"));%>
                            <a href="../usuario/administrarUsuario.jsp?requerimiento=cerrarSesion">  (Cerrar sesión)</a>
                        </div>
                             <ol class="breadcrumb">
                            <li><a href="#">Inicio</a></li>
                            <li><a href="#">Docente</a></li>
                        </ol>
                    </div>
                        <div class="row">
                            <div id="error">
                                <p><strong><% 
                                                if(session.getAttribute("Mensaje")!=null){
                                                out.print(session.getAttribute("Mensaje"));}
                                                
                                                
    
                                %></strong></p>
                            </div>
                        </div>
                        <div class="col-xs-offset-3 col-xs-10" id="contenedor">
                            <div id="subtitulo">
                            <h2>Listado de Aspirantes</h2>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <strong>Aspirantes</strong>
                                </div>
                                <div class="panel-body">
                                    <div class="table-responsive">
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th>Código</th>
                                                    <th>Nombre</th>
                                                    <th>Estado</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <% out.println(session.getAttribute("listadoAspirantes")); %>
                                            </tbody>
                                        </table>
                                    
                                    </div>
                                </div>
                            </div>
                        </div>
                </div>
            </div>
        </section>
        <footer>
            <p><strong>Copyright © 2014. Programa de Ingeniería de Sistemas - UFPS</strong></p>
            <p>Desarrollado por <strom><a href="#">Megaterios</a></strong></p>
        </footer>
        <!--Scripts-->
        <script src="../../js/modernizr.js"></script>
        <script src="../../js/main.js"></script>
        <script src="../../js/jquery.js"></script>
        <!--Scripts Bootstrap-->
        <script src="../../js/bootstrap.js"></script>
        <script src="../../js/vendor/bootstrap-filestyle.js"></script>
        <!-- Core Scripts - Include with every page -->
        <script src="../../js/jquery-1.10.2.js"></script>
        <script src="../../js/bootstrap.min.js"></script>
        <script src="../../js/plugins/metisMenu/jquery.metisMenu.js"></script>
        <!-- Page-Level Plugin Scripts - Tables -->
        <script src="../../js/plugins/dataTables/jquery.dataTables.js"></script>
        <script src="../../js/plugins/dataTables/dataTables.bootstrap.js"></script>
        <!-- SB Admin Scripts - Include with every page -->
        <script src="../../js/sb-admin.js"></script>
        <!-- Page-Level Demo Scripts - Tables - Use for reference -->
        <script>
        $(document).ready(function() {
            $('#dataTables-example').dataTable();
        });
        </script>
    </div>
</body>
</html>
