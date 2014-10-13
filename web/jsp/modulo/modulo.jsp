<%-- 
    Document   : modulo
    Created on : 27/09/2014, 05:55:36 PM
    Author     : Manuel
--%>
<!doctype html>
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
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" id="contenido">
                        <div class="row">
                            <div class="col-xs-offset-1 col-xs-10 alert alert-success">
                                <div id="error">
                                    <p><strong><% out.print(session.getAttribute("Mensaje"));%></strong></p>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-offset-1 col-xs-10" id="subtitulo">
                                <h2>Administrar Modulo</h2>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-offset-1 col-xs-10" id="contenedor">
                                <div class="row" id="formulario">
                                    <form action="../docente/administrarFuncionesCoordinador.jsp" class="form-horizontal" method="get" role="form">
                                        <fieldset>
                                            <legend>Datos del Modulo</legend>
                                            <div class="form-group">
                                                <label for="nombre" class="col-xs-12 col-sm-6 col-md-4 control-label">Nombre:</label>
                                                <div class="col-xs-12 col-sm-6 col-md-8">
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
                                                        <input class="form-control" id="nombre" name="nombre" placeholder="Ingenieria del software" <% out.print(session.getAttribute("nombre"));%> type="text" enabled>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                    <label for="horas" class="col-xs-12 col-sm-6 col-md-4 control-label">Cantidad de Horas:</label>
                                                    <div class="col-xs-12 col-sm-6 col-md-8">
                                                        <div class="input-group">
                                                            <span class="input-group-addon"><span class="glyphicon glyphicon-stats"></span></span>
                                                            <input class="form-control" id="horas" name="horas" placeholder="30" <% out.print(session.getAttribute("horas"));%> type="text" enabled>
                                                        </div>
                                                    </div>
                                                </div>
                                            <div class="form-group">
                                                <label for="tipo" class="col-xs-12 col-sm-6 col-md-4 control-label">Tipo:</label>
                                                <div class="col-xs-12 col-sm-6 col-md-8">
                                                    <select class="form-control" id="tipo" name="tipo" enabled>
                                                        <%
                                                        String [] opciones = {"Fijo", "Acompañamiento"};
                                                        for(int i = 0; i<opciones.length; i++){
                                                            out.print("<option value=\"" + (i+1) +"\">"+ opciones[i] +"</option>" + "\n\t\t\t\t\t\t\t");
                                                        }
                                                        %>
                                                    </select>
                                                 </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="fechaInicio" class="col-xs-12 col-sm-6 col-md-4 control-label">Fecha de Inicio:</label>
                                                <div class="col-xs-12 col-sm-6 col-md-8">
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                                                        <input class="form-control" id="fechaInicio" name="fechaInicio" placeholder="16/04/2015" <% out.print(session.getAttribute("fechaInicio"));%> type="text" enabled>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="horario" class="col-xs-12 col-sm-6 col-md-4 control-label">Horario:</label>
                                                <div class="col-xs-12 col-sm-6 col-md-8">
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><span class="glyphicon glyphicon-list-alt"></span></span>
                                                        <input class="form-control" id="horario" name="horario"  value =" <% out.print(session.getAttribute("horario")); %>" type="text" disabled>
                                                        
                                                    </div>
                                                    
                                                    <div class="col-xs-12 text-center">
                                                        <button class="btn btn-danger" id="agregar" name="requerimiento" value="horarioBtn" type="submit" >Crear Horario</button>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="profesor" class="col-xs-12 col-sm-6 col-md-4 control-label">Profesor:</label>
                                                <div class="col-xs-12 col-sm-6 col-md-8">
                                                    <select class="form-control" id="profesor" name="profesor" enabled>
                                                        <% 
                                                        String profes = session.getAttribute("profesores").toString();
                                                        String [] profesores = profes.split(";");
                                                        for(int i = 0; i<profesores.length; i++){
                                                            String p [] = profesores[i].split("-");
                                                            out.print("<option value=\"" + (i) +"\">"+ p[1]+" "+p[2] +"</option>" + "\n\t\t\t\t\t\t\t");
                                                        }
                                                        %>
                                                    </select>
                                                 </div>
                                            </div>
                                        </fieldset>
                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-xs-12 text-center">
                                                    <button class="btn btn-danger" id="consultar" name="requerimiento" value="consultarModulo" type="submit" >Consultar</button>
                                                    <button class="btn btn-danger" id="registrar" name="requerimiento" value="registrarModulo" type="submit" >Registrar</button>
                                                    <button class="btn btn-danger" id="actualizar" name="requerimiento" value="actualizarModulo" type="submit" >Actualizar</button>
                                                    <button class="btn btn-danger" id="eliminar" name="requerimiento" value="eliminarModulo" type="submit" >Eliminar</button>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-xs-offset-4 col-xs-4 text-center">
                                                    <button class="btn btn-danger" id="cancelar" name="requerimiento" value="cancelarModulo" type="submit">Cancelar</button>
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
            <!--Scripts Bootstrap-->
            <script src="../../js/bootstrap.js"></script>
            <script src="../../js/vendor/bootstrap-filestyle.js"></script>
            <script src="../../js/vendor/bootstrap-formhelpers.js"></script>

        </div>
    </body>
</html>
