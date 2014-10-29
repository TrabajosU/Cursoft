<%-- 
    Document   : estudiante
    Created on : 27/09/2014, 08:37:49 PM
    Author     : Manuel
--%>

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
                                        <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> Operaciones<span class="fa arrow"></span></a>
                                        <ul class="nav nav-second-level">
                                            <li>
                                                <a href="administrarEstudiante.jsp?requerimiento=consultarCorreo">Consultar Datos</a>
                                            </li>
                                            <li>
                                                <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> Administrar Módulos<span class="fa arrow"></span></a>
                                                <ul class="nav nav-third-level">
                                                    <li>
                                                        <a href="../modulo/administrarModulo.jsp?requerimiento=matricularModuloEstudiante">Matricular Módulo</a>                                                                                                
                                                        <a href="../modulo/administrarModulo.jsp?requerimiento=consultarModulosEstudiante">Consultar Módulos</a>
                                                    </li>                                            
                                                </ul>
                                            </li>                                            
                                        </ul>
                                    </li>
                                    <li>
                                        <a href="../usuario/administrarUsuario.jsp?requerimiento=cerrarSesion">Cerrar Sesión</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-9 col-sm-9 col-md-9 col-lg-9" id="contenido">
                        <div class="text-right">
                            <% out.print(session.getAttribute("nombre") + " " + session.getAttribute("apellido"));%>
                            <a href="../usuario/administrarUsuario.jsp?requerimiento=cerrarSesion">  (Cerrar sesión)</a>
                        </div>
                        <ol class="breadcrumb">
                            <li><a href="administrarEstudiante.jsp?requerimiento=mostrarInicio">Inicio</a></li>
                            <li class="active">Estudiante</li>
                        </ol>
                        <div id="subtitulo">
                            <h2>Consultar Datos</h2>
                        </div>
                        <div class="row">
                            <div id="error">
                                <p><strong><%
                                    out.print(session.getAttribute("Mensaje"));
                                    session.setAttribute("Mensaje", "");
                                        %>
                                    </strong></p>
                            </div>
                        </div>                                           
                        <div class="row">
                            <div class="col-xs-offset-1 col-xs-10" id="contenedor">
                                <div class="row" id="formulario">
                                    <form action="administrarEstudiante.jsp" class="form-horizontal" method="post" role="form">
                                        <fieldset>
                                            <legend>Datos de Usuario</legend>
                                            <div class="form-group">
                                                <label for="codigo" class="col-xs-12 col-sm-6 col-md-4 control-label">Código:</label>
                                                <div class="col-xs-12 col-sm-6 col-md-8">
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><span class="glyphicon glyphicon-qrcode"></span></span>
                                                        <input class="form-control" id="codigo" name="codigo" value="<% out.print(session.getAttribute("codigo"));%>" type="text">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="correo" class="col-xs-12 col-sm-6 col-md-4 control-label">Correo electrónico:</label>
                                                <div class="col-xs-12 col-sm-6 col-md-8">
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><span class="glyphicon glyphicon-envelope"></span></span>
                                                        <input class="form-control" id="correo" name="correo" value="<% out.print(session.getAttribute("correo"));%>" type="text">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-xs-12 col-sm-6 col-md-4 control-label" for="contrasenia" >Contraseña:</label>
                                                <div class="col-xs-12 col-sm-6 col-md-8">
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
                                                        <input class="form-control" id="contrasenia" name="contrasenia" value="<% out.print(session.getAttribute("contrasenia"));%>" type="password">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-xs-12 col-sm-6 col-md-4 control-label" for="confirmarContrasenia">Confirmar contraseña:</label>
                                                <div class="col-xs-12 col-sm-6 col-md-8">
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
                                                        <input class="form-control" id="confirmarContrasenia" name="confirmarContrasenia" value="<% out.print(session.getAttribute("contrasenia2"));%>" type="password">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="nombre" class="col-xs-12 col-sm-6 col-md-4 control-label">Nombre:</label>
                                                <div class="col-xs-12 col-sm-6 col-md-8">
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
                                                        <input class="form-control" id="nombre" name="nombre" value="<% out.print(session.getAttribute("nombre"));%>" type="text">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="apellido" class="col-xs-12 col-sm-6 col-md-4 control-label">Apellido:</label>
                                                <div class="col-xs-12 col-sm-6 col-md-8">
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
                                                        <input class="form-control" id="apellido" name="apellido" value="<% out.print(session.getAttribute("apellido"));%>" type="text">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="idTipoDocumento" class="col-xs-12 col-sm-6 col-md-4 control-label">Tipo de documento:</label>
                                                <div class="col-xs-12 col-sm-6 col-md-8">
                                                    <select class="form-control" id="idTipoDocumento" name="idTipoDocumento">
                                                        <%
                                                            String[] opciones = {"Cédula de ciudadanía", "Tarjeta de identidad", "Pasaporte"};
                                                            for (int i = 0; i < opciones.length; i++) {
                                                                out.print("<option value=\"" + (i + 1) + "\">" + opciones[i] + "</option>" + "\n\t\t\t\t\t\t\t");
                                                            }
                                                        %>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="numeroDocumento" class="col-xs-12 col-sm-6 col-md-4 control-label">Número de documento:</label>
                                                <div class="col-xs-12 col-sm-6 col-md-8">
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><span class="glyphicon glyphicon-barcode"></span></span>
                                                        <input class="form-control" id="numeroDocumento" name="numeroDocumento" value="<% out.print(session.getAttribute("documento"));%>" type="text">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="fechaNacimiento" class="col-xs-12 col-sm-6 col-md-4 control-label">Fecha de nacimiento:</label>
                                                <div class="col-xs-12 col-sm-6 col-md-8">
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                                                        <input class="form-control" id="fechaNacimiento" name="fechaNacimiento" value="<% out.print(session.getAttribute("fechaNacimiento"));%>" type="text">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="direccion" class="col-xs-12 col-sm-6 col-md-4 control-label">Dirección de residencia:</label>
                                                <div class="col-xs-12 col-sm-6 col-md-8">
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><span class="glyphicon glyphicon-home"></span></span>
                                                        <input class="form-control" id="direccion" name="direccion" value="<% out.print(session.getAttribute("direccion"));%>" type="text">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="telefono" class="col-xs-12 col-sm-6 col-md-4 control-label">Teléfono:</label>
                                                <div class="col-xs-12 col-sm-6 col-md-8">
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><span class="glyphicon glyphicon-phone-alt"></span></span>
                                                        <input class="form-control" id="telefono" name="telefono" value="<% out.print(session.getAttribute("telefono"));%>" type="text">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="telefonoMovil" class="col-xs-12 col-sm-6 col-md-4 control-label">Teléfono móvil:</label>
                                                <div class="col-xs-12 col-sm-6 col-md-8">
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><span class="glyphicon glyphicon-phone"></span></span>
                                                        <input class="form-control" id="telefonoMovil" name="telefonoMovil" value="<% out.print(session.getAttribute("telefonoMovil"));%>" type="text">
                                                    </div>
                                                </div>
                                            </div>
                                        </fieldset>
                                        <fieldset>
                                            <legend>Datos de Aspirante</legend>
                                            <div class="form-group">
                                                <label for="promedioPonderado" class="col-xs-12 col-sm-6 col-md-4 control-label">Promedio ponderado:</label>
                                                <div class="col-xs-12 col-sm-6 col-md-8">
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><span class="glyphicon glyphicon-stats"></span></span>
                                                        <input class="form-control" id="promedioPonderado" name="promedioPonderado" value="<% out.print(session.getAttribute("promedio"));%>" type="text">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="semestreFinalizacionMaterias" class="col-xs-12 col-sm-6 col-md-4 control-label">Semestre de terminación de materias:</label>
                                                <div class="col-xs-12 col-sm-6 col-md-8">
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><span class="glyphicon glyphicon-list-alt"></span></span>
                                                        <input class="form-control" id="semestreFinalizacionMaterias" name="semestreFinalizacionMaterias" value="<% out.print(session.getAttribute("semestreTerminacionMaterias"));%>" type="text">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="reporteFinalizacionMaterias" class="col-xs-12 col-sm-6 col-md-4 control-label">Reporte de terminación de materias:</label>
                                                <div class="col-xs-12 col-sm-6 col-md-8">                                                    
                                                    <!--agregado-->

                                                    <a href="<% out.print(session.getAttribute("reporteFinalizacionMaterias"));%>" class="thumbnail">
                                                        <img src="<% out.print(session.getAttribute("reporteFinalizacionMaterias"));%>" alt="Reporte Finalización de Materias">
                                                    </a>  
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="reportePazSalvo" class="col-xs-12 col-sm-6 col-md-4 control-label">Reporte de paz y salvo:</label>
                                                <div class="col-xs-12 col-sm-6 col-md-8">                                                    
                                                    <!--agregado-->

                                                    <a href="<% out.print(session.getAttribute("reportePazSalvo"));%>" class="thumbnail">
                                                        <img src="<% out.print(session.getAttribute("reportePazSalvo"));%>" alt="Reporte Paz y Salvo">
                                                    </a>  

                                                </div>



                                            </div>
                                            <div class="form-group">
                                                <label for="reciboInscripcion" class="col-xs-12 col-sm-6 col-md-4 control-label">Recibo de pago de inscripción:</label>
                                                <div class="col-xs-12 col-sm-6 col-md-8">                                                   
                                                    <!--agregado-->                                                    
                                                    <a href="<% out.print(session.getAttribute("reciboInscripcion"));%>" class="thumbnail">
                                                        <img src="<% out.print(session.getAttribute("reciboInscripcion"));%>" alt="Recibo Inscripción">
                                                    </a>  
                                                </div>
                                            </div>
                                        </fieldset>
                                        <fieldset>
                                            <legend>Datos de Estudiante</legend>
                                            <div class="form-group">
                                                <label for="reciboPagoMatricula" class="col-xs-12 col-sm-6 col-md-4 control-label">Recibo de pago de matrícula:</label>
                                                <div class="col-xs-12 col-sm-6 col-md-8">                                                    
                                                    <!--agregado-->

                                                    <a href="<% out.print(session.getAttribute("reciboPagoMatricula"));%>" class="thumbnail">
                                                        <img src="<% out.print(session.getAttribute("reciboPagoMatricula"));%>" alt="Recibo Pago Matrícula">
                                                    </a>  
                                                </div>
                                            </div>                                            
                                        </fieldset>
                                        <% out.print(session.getAttribute("actualizar"));%>
                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-xs-offset-4 col-xs-4 text-center">
                                                    <button class="btn btn-danger" id="cancelar" name="requerimiento" value="cancelar" type="submit">Cancelar</button>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <footer>
                <p><strong>Copyright © 2014. Programa de Ingeniería de Sistemas - UFPS</strong></p>
                <p>Desarrollado por: <span class="icon-github"></span><strong><a id="megaterios" href="https://github.com/Megaterios/"> Megaterios</a></strong></p>
            </footer>

            <!--Scripts-->
            <script src="../../js/modernizr.js"></script>
            <script src="../../js/main.js"></script>
            <script src="../../js/jquery.js"></script>
            <script src="../../js/angular.js"></script>
            <!--Scripts Bootstrap-->
            <script src="../../js/bootstrap.js"></script>
            <script src="../../js/vendor/bootstrap-filestyle.js"></script>
            <script src="../../js/vendor/bootstrap-formhelpers.js"></script>
            <!-- Core Scripts - Include with every page -->
            <script src="../../js/jquery-1.10.2.js"></script>
            <script src="../../js/bootstrap.min.js"></script>
            <script src="../../js/plugins/metisMenu/jquery.metisMenu.js"></script>
            <!-- Page-Level Plugin Scripts - Tables -->
            <script src="../../js/plugins/dataTables/jquery.dataTables.js"></script>
            <script src="../../js/plugins/dataTables/dataTables.bootstrap.js"></script>
            <!-- SB Admin Scripts - Include with every page -->
            <script src="../../js/sb-admin.js"></script>


            <script src="../../js/plugins/flot/excanvas.min.js"></script>
            <script src="../../js/plugins/flot/jquery.flot.js"></script>
            <script src="../../js/plugins/flot/jquery.flot.pie.js"></script>
            <script src="../../js/plugins/flot/jquery.flot.resize.js"></script>
            <script src="../../js/plugins/flot/jquery.flot.tooltip.min.js"></script>

            <script src="../../js/plugins/metisMenu/jquery.metisMenu.js"></script>


            <script src="../../js/plugins/morris/morris.js"></script>
            <script src="../../js/plugins/morris/raphael-2.1.0.min.js"></script>





            <!-- Page-Level Demo Scripts - Tables - Use for reference -->
            <script>
                $(document).ready(function () {
                    $('#dataTables-example').dataTable();
                });
            </script>
        </div>
    </body>
</html>