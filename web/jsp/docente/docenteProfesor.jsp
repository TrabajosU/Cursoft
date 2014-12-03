<%-- 
    Document   : docenteCoordinador
    Created on : 03-dic-2014, 6:15:31
    Author     : Jhorman Perez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <!--CodificaciÃ³n de caracteres-->
        <meta charset="utf-8">
        <!--Titulo-->
        <title>CURSOFT - Sistema de InformaciÃ³n</title>
        <!--VisualizaciÃ³n-->
        <meta content="width=device-width, heigth=device-height, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <!--InformaciÃ³n-->
        <meta content="CURSOFT - Sistema de informaciÃ³n para la administraciÃ³n de curso de profundizaciÃ³n" name="description">
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
                            <a href="../usuario/administrarUsuario.jsp?requerimiento=cerrarSesion">  (Cerrar sesiÃ³n)</a>
                        </div>
                             <ol class="breadcrumb">
                            <li><a href="#">Inicio</a></li>
                            <li><a href="#">Docente</a></li>
                        </ol>
                    </div>
                    <div class="col-xs-6 col-
                         sm-12 col-md-9 col-lg-12" id="contenido">                        
                        <div class="text-center" id="subtitulo">
                            <h2>Administrar Profesor</h2>
                        </div>
                        <div class="row">
                            <div id="error">
                                <p><strong><% 
                                                if(session.getAttribute("Mensaje")!=null){
                                                out.print(session.getAttribute("Mensaje"));}
                                                
                                                
    
                                %></strong></p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-offset-1 col-xs-10" id="contenedor">
                                <div class="row" id="formulario">
                                    <form action="administrarFuncionesCoordinador.jsp" class="form-horizontal" method="get" role="form">
                                        <fieldset>
                                            <legend>Datos de Usuario</legend>
                                            <div class="form-group">
                                                <label for="codigo" class="col-xs-12 col-sm-6 col-md-4 control-label">CÃ³digo:</label>
                                                <div class="col-xs-12 col-sm-6 col-md-8">
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><span class="glyphicon glyphicon-qrcode"></span></span>
                                                        <input class="form-control" id="codigo" name="codigo" placeholder="12043" <% out.print(session.getAttribute("codigo"));%> type="text">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="correo" class="col-xs-12 col-sm-6 col-md-4 control-label">Correo electrÃ³nico:</label>
                                                <div class="col-xs-12 col-sm-6 col-md-8">
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><span class="glyphicon glyphicon-envelope"></span></span>
                                                        <input class="form-control" id="correo" name="correo" placeholder="profesor@gmail.com" <% out.print(session.getAttribute("correo"));%> type="text" enabled>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-xs-12 col-sm-6 col-md-4 control-label" for="contrasenia" >ContraseÃ±a:</label>
                                                <div class="col-xs-12 col-sm-6 col-md-8">
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
                                                        <input class="form-control" id="contrasenia" name="contrasenia" placeholder= "********" <% out.print(session.getAttribute("contrasenia"));%> type="password">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-xs-12 col-sm-6 col-md-4 control-label" for="confirmarContrasenia">Confirmar contraseÃ±a:</label>
                                                <div class="col-xs-12 col-sm-6 col-md-8">
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
                                                        <input class="form-control" id="confirmarContrasenia" name="confirmarContrasenia" placeholder= "********" <% out.print(session.getAttribute("contrasenia2"));%> type="password" enabled>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="nombre" class="col-xs-12 col-sm-6 col-md-4 control-label">Nombre:</label>
                                                <div class="col-xs-12 col-sm-6 col-md-8">
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
                                                        <input class="form-control" id="nombre" name="nombre" placeholder="Marco" <% out.print(session.getAttribute("nombre"));%> type="text" enabled>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="apellido" class="col-xs-12 col-sm-6 col-md-4 control-label">Apellido:</label>
                                                <div class="col-xs-12 col-sm-6 col-md-8">
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
                                                        <input class="form-control" id="apellido" name="apellido" placeholder="Adarme Jaimes" <% out.print(session.getAttribute("apellido"));%> type="text" enabled>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="idTipoDocumento" class="col-xs-12 col-sm-6 col-md-4 control-label">Tipo de documento:</label>
                                                <div class="col-xs-12 col-sm-6 col-md-8">
                                                    <select class="form-control" id="idTipoDocumento" name="idTipoDocumento" enabled>
                                                        <%
                                                        String [] opciones = {"CÃ©dula de ciudadania", "Tarjeta de identidad", "Pasaporte"};
                                                        for(int i = 0; i<opciones.length; i++){
                                                            out.print("<option value=\"" + (i+1) +"\">"+ opciones[i] +"</option>" + "\n\t\t\t\t\t\t\t");
                                                        }
                                                        %>
                                                    </select>
                                                 </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="numeroDocumento" class="col-xs-12 col-sm-6 col-md-4 control-label">NÃºmero de documento:</label>
                                                <div class="col-xs-12 col-sm-6 col-md-8">
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><span class="glyphicon glyphicon-barcode"></span></span>
                                                        <input class="form-control" id="numeroDocumento" name="numeroDocumento" placeholder="88214098" <% out.print(session.getAttribute("documento"));%> type="text" enabled>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="fechaNacimiento" class="col-xs-12 col-sm-6 col-md-4 control-label">Fecha de nacimiento:</label>
                                                <div class="col-xs-12 col-sm-6 col-md-8">
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                                                        <input class="form-control" id="fechaNacimiento" name="fechaNacimiento" placeholder="25/04/1975" <% out.print(session.getAttribute("fechaNacimiento"));%> type="text" enabled>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="direccion" class="col-xs-12 col-sm-6 col-md-4 control-label">DirecciÃ³n de residencia:</label>
                                                <div class="col-xs-12 col-sm-6 col-md-8">
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><span class="glyphicon glyphicon-home"></span></span>
                                                        <input class="form-control" id="direccion" name="direccion" placeholder="Av 5A #5-66 CeibaII" <% out.print(session.getAttribute("direccion"));%> type="text" enabled>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="telefono" class="col-xs-12 col-sm-6 col-md-4 control-label">TelÃ©fono:</label>
                                                <div class="col-xs-12 col-sm-6 col-md-8">
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><span class="glyphicon glyphicon-phone-alt"></span></span>
                                                        <input class="form-control" id="telefono" name="telefono" placeholder="5756836" <% out.print(session.getAttribute("telefono"));%> type="text" enabled>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="telefonoMovil" class="col-xs-12 col-sm-6 col-md-4 control-label">TelÃ©fono mÃ³vil:</label>
                                                <div class="col-xs-12 col-sm-6 col-md-8">
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><span class="glyphicon glyphicon-phone"></span></span>
                                                        <input class="form-control" id="telefonoMovil" name="telefonoMovil" placeholder="3165783452" <% out.print(session.getAttribute("telefonoMovil"));%> type="text" enabled>
                                                    </div>
                                                </div>
                                            </div>
                                        </fieldset>
                                        <fieldset>
                                            <legend>Datos del Profesor</legend>
                                            <div class="form-group">
                                                <label for="escolaridad" class="col-xs-12 col-sm-6 col-md-4 control-label">Nivel de Escolaridad:</label>
                                                <div class="col-xs-12 col-sm-6 col-md-8">
                                                    <select class="form-control" id="escolaridad" name="escolaridad">
                                                        <%
                                                        String [] nivel = {"Universidad", "Especializacion", "Magister","Doctorado","PH"};
                                                        for(int i = 0; i<nivel.length; i++){
                                                            out.print("<option value=\"" + (i+1) +"\">"+ nivel[i] +"</option>" + "\n\t\t\t\t\t\t\t");
                                                        }
                                                        %>
                                                    </select>
                                                </div>
                                            </div>
                                                  
                                            <div class="form-group">
                                                <label for="escalafon" class="col-xs-12 col-sm-6 col-md-4 control-label">Nivel de EscalafÃ³n:</label>
                                                <div class="col-xs-12 col-sm-6 col-md-8">
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><span class="glyphicon glyphicon-stats"></span></span>
                                                        <input class="form-control" id="escalafon" name="escalafon" placeholder="4" <% out.print(session.getAttribute("escalafon"));%> type="text" enabled>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="puntaje" class="col-xs-12 col-sm-6 col-md-4 control-label">Puntaje:</label>
                                                <div class="col-xs-12 col-sm-6 col-md-8">
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><span class="glyphicon glyphicon-stats"></span></span>
                                                        <input class="form-control" id="puntaje" name="puntaje" placeholder="3.7" <% out.print(session.getAttribute("puntaje"));%> type="text" enabled>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="contrato" class="col-xs-12 col-sm-6 col-md-4 control-label">Contrato:</label>
                                                <div class="col-xs-12 col-sm-6 col-md-8">
                                                    <select class="form-control" id="contrato" name="contrato" enabled>
                                                        <%
                                                        String [] tipo = {"Catedra", "Planta"};
                                                        for(int i = 0; i<tipo.length; i++){
                                                            out.print("<option value=\"" + (i+1) +"\">"+ tipo[i] +"</option>" + "\n\t\t\t\t\t\t\t");
                                                        }
                                                        %>
                                                    </select>
                                                </div>
                                            </div>        
                                        </fieldset>
                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-xs-12 text-center">
                                                    <button class="btn btn-danger" id="consultar" name="requerimiento" value="consultarDocente" type="submit" >Consultar</button>
                                                    <button class="btn btn-danger" id="registrar" name="requerimiento" value="registrarDocente" type="submit" >Registrar</button>
                                                    <button class="btn btn-danger" id="actualizar" name="requerimiento" value="actualizarDocente" type="submit" >Actualizar</button>
                                                    <button class="btn btn-danger" id="eliminar" name="requerimiento" value="eliminarDocente" type="submit" >Eliminar</button>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-xs-offset-4 col-xs-4 text-center">
                                                    <button class="btn btn-danger" id="cancelar" name="requerimiento" value="cancelarDocente" type="submit">Cancelar</button>
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
                <p><strong>Copyright Â© 2014. Programa de IngenierÃ­a de Sistemas - UFPS</strong></p>
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
