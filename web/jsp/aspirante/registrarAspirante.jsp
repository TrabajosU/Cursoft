<%-- 
    Document   : registrarAspirante
    Created on : 19-oct-2014, 16:06:17
    Author     : Jhorman Perez
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
                    <div class="col-xs-6 col-
                         sm-12 col-md-9 col-lg-12" id="contenido">                        
                        <div class="text-center" id="subtitulo">
                            <h2>Registrar Aspirante</h2>
                        </div>
                        <div class="row">
                            <div id="error">
                                <p><strong><% out.print(session.getAttribute("Mensaje"));%></strong></p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-offset-1 col-xs-10" id="contenedor">
                                <div class="row" id="formulario">
                                    <form action="administrarAspirante.jsp" class="form-horizontal" method="post" enctype="MULTIPART/FORM-DATA" role="form">
                                        <fieldset>
                                            <legend>Datos de Usuario</legend>
                                            <div class="form-group">
                                                <label for="codigo" class="col-xs-12 col-sm-6 col-md-4 control-label">Código:</label>
                                                <div class="col-xs-12 col-sm-6 col-md-8">
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><span class="glyphicon glyphicon-qrcode"></span></span>
                                                        <input class="form-control" id="codigo" name="codigo" type="text" required>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="correo" class="col-xs-12 col-sm-6 col-md-4 control-label">Correo electrónico:</label>
                                                <div class="col-xs-12 col-sm-6 col-md-8">
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><span class="glyphicon glyphicon-envelope"></span></span>
                                                        <input class="form-control" id="correo" name="correo" type="text" required>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-xs-12 col-sm-6 col-md-4 control-label" for="contrasenia" >Contraseña:</label>
                                                <div class="col-xs-12 col-sm-6 col-md-8">
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
                                                        <input class="form-control" id="contrasenia" name="contrasenia" placeholder= "********" type="password" required>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-xs-12 col-sm-6 col-md-4 control-label" for="confirmarContrasenia">Confirmar contraseña:</label>
                                                <div class="col-xs-12 col-sm-6 col-md-8">
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
                                                        <input class="form-control" id="confirmarContrasenia" name="confirmarContrasenia" placeholder= "********" type="password" required>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="nombre" class="col-xs-12 col-sm-6 col-md-4 control-label">Nombre:</label>
                                                <div class="col-xs-12 col-sm-6 col-md-8">
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
                                                        <input class="form-control" id="nombre" name="nombre" type="text" required>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="apellido" class="col-xs-12 col-sm-6 col-md-4 control-label">Apellido:</label>
                                                <div class="col-xs-12 col-sm-6 col-md-8">
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
                                                        <input class="form-control" id="apellido" name="apellido" type="text" required>
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
                                                        <input class="form-control" id="numeroDocumento" name="numeroDocumento" placeholder="13278413" type="text" required>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="fechaNacimiento" class="col-xs-12 col-sm-6 col-md-4 control-label">Fecha de nacimiento:</label>
                                                <div class="col-xs-12 col-sm-6 col-md-8">
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                                                        <input class="form-control" id="fechaNacimiento" name="fechaNacimiento" type="date" required>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="direccion" class="col-xs-12 col-sm-6 col-md-4 control-label">Dirección de residencia:</label>
                                                <div class="col-xs-12 col-sm-6 col-md-8">
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><span class="glyphicon glyphicon-home"></span></span>
                                                        <input class="form-control" id="direccion" name="direccion" placeholder="Cl 21A 11 48 Br Alfonso Lopez" type="text" required>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="telefono" class="col-xs-12 col-sm-6 col-md-4 control-label">Teléfono:</label>
                                                <div class="col-xs-12 col-sm-6 col-md-8">
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><span class="glyphicon glyphicon-phone-alt"></span></span>
                                                        <input class="form-control" id="telefono" name="telefono" placeholder="5822276" type="text" required>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="telefonoMovil" class="col-xs-12 col-sm-6 col-md-4 control-label">Teléfono móvil:</label>
                                                <div class="col-xs-12 col-sm-6 col-md-8">
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><span class="glyphicon glyphicon-phone"></span></span>
                                                        <input class="form-control" id="telefonoMovil" name="telefonoMovil" placeholder="3137496602" type="text" required>
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
                                                        <input class="form-control" id="promedioPonderado" name="promedioPonderado" placeholder="4.2" type="text" required>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="semestreFinalizacionMaterias" class="col-xs-12 col-sm-6 col-md-4 control-label">Semestre de terminación de materias:</label>
                                                <div class="col-xs-12 col-sm-6 col-md-8">
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><span class="glyphicon glyphicon-list-alt"></span></span>
                                                        <input class="form-control" id="semestreFinalizacionMaterias" name="semestreFinalizacionMaterias" placeholder="02/2015" type="text" required>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="reporteFinalizacionMaterias" class="col-xs-12 col-sm-6 col-md-4 control-label">Reporte de terminación de materias:</label>
                                                <div class="col-xs-12 col-sm-6 col-md-8">
                                                    <input type="file" class="filestyle" id="reporteFinalizacionMaterias" name="reporteFinalizacionMaterias" data-iconName="glyphicon-inbox" required>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="reportePazSalvo" class="col-xs-12 col-sm-6 col-md-4 control-label">Reporte de paz y salvo:</label>
                                                <div class="col-xs-12 col-sm-6 col-md-8">
                                                    <input type="file" class="filestyle" id="reportePazSalvo" name="reportePazSalvo" data-iconName="glyphicon-inbox" required>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="reciboInscripcion" class="col-xs-12 col-sm-6 col-md-4 control-label">Recibo de pago de inscripción:</label>
                                                <div class="col-xs-12 col-sm-6 col-md-8">
                                                    <input type="file" class="filestyle" id="reciboInscripcion" name="reciboInscripcion" data-iconName="glyphicon-inbox" required>
                                                </div>
                                            </div>
                                        </fieldset>
                                        <fieldset>                                            
                                        </fieldset>
                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-xs-12 text-center">                                                    
                                                    <button class="btn btn-danger" id="actualizar" name="requerimiento" value="registrarAspirante" type="submit" >Registrar</button>                                                    
                                                </div>
                                            </div>
                                        </div>                                        
                                    </form>
                                    <div id="registro">
                                        <a class="btn btn-danger" role="button" href="../usuario/iniciarSesion.jsp">Cancelar</a>
                                    </div>
                                </div>
                            </div>
                        </div>    

                    </div>
                </div>
                <br>
                <br>
                <br>
                <br>
            </section>

            <footer>
                <p><strong>Copyright © 2014. Programa de Ingeniería de Sistemas - UFPS</strong></p>
                <p>Desarrollado por: <span class="icon-github"></span><strong><a id="megaterios" href="https://github.com/Megaterios/"> Megaterios</a></strong></p>
            </footer>

            <!--Scripts-->
            <script src="../../js/modernizr.js"></script>
            <script src="../../js/main.js"></script>
            <script src="../../js/jquery.js"></script>
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

            <!-- Page-Level Demo Scripts - Tables - Use for reference -->
            <script>
                $(document).ready(function () {
                    $('#dataTables-example').dataTable();
                });
            </script>

        </div>
    </body>
</html>
