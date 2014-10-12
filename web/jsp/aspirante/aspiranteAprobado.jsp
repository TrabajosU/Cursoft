<%-- 
    Document   : aspiranteAprobado
    Created on : 12/10/2014, 01:22:24 PM
    Author     : Jhorman Perez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>        
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
        <meta name="description" content="CURSOFT - Sistema de información para la administración de curso de profundización">

        <title>CURSOFT - Sistema de Información</title>


        <link href="../../css/bootstrap.min.css" rel="stylesheet">
        <link href="../../css/bootstrap-theme.min.css" rel="stylesheet">
        <link href="../../css/style.css" rel="stylesheet">

        <script src="../../js/vendor/modernizr-2.6.2.min.js"></script>
        <script src="../../js/vendor/jquery-1.10.2.min.js"></script>
        <script src="../../js/bootstrap-filestyle.min.js"></script>
        <script src="../../js/plugins.js"></script>
        <script src="../../js/main.js"></script>
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
                        <ul class="nav nav-pills nav-stacked">
                            <li class=""><strong><a href="inicio_aspirante_aprobado.html">Aspirante</a></strong></li>
                            <li class=""><a href="consultar_aspirante.html">Consultar</a></li>
                            <li class=""><a href="actualizar_aspirante.html">Actualizar</a></li>
                            <li class=""><a href="actualizar_aspirante.html">Borrar</a></li>
                            <li class=""><strong><a href="inicio_aspirante_aprobado.html">Estudiante</a></strong></li>
                            <li class=""><a href="consultar_aspirante.html">Consultar</a></li>
                            <li class=""><a href="actualizar_aspirante.html">Actualizar</a></li>
                            <li class=""><a href="actualizar_aspirante.html">Borrar</a></li>
                            <li class=""><strong><a href="inicio_aspirante_aprobado.html">Docente</a></strong></li>
                            <li class=""><a href="consultar_aspirante.html">Consultar</a></li>
                            <li class=""><a href="actualizar_aspirante.html">Actualizar</a></li>
                            <li class=""><a href="actualizar_aspirante.html">Borrar</a></li>
                        </ul>
                    </div>
                    <div class="col-xs-12 col-sm-9 col-md-9 col-lg-9" id="contenido">
                        <ol class="breadcrumb">
                            <li><a href="#">Inicio</a></li>
                            <li class="active">Aspirante</li>
                        </ol>
                        <div id="subtitulo">
                            <h2>Iniciar Aspirante - Aprobado</h2>
                        </div>
                        <div class="row">
                            <div class="col-xs-offset-1 col-xs-10" id="contenedor">
                                <p>Consignar el valor de $ X.XXX.XXX</p>
                                <p>En cualquiera de los siguietes bancos:</p>
                                <ol>
                                    <li>Bancolombia</li>
                                    <li>Davivienda</li>
                                    <li>Banco de Bogotá</li>
                                </ol>
                                <p>Si ya realizo el pago, cargo el archivo a continuación:</p>
                                <div id="formulario">
                                    <form action="#" method="post" role="form">
                                        <fieldset>
                                            <legend>Documentos</legend>
                                            <div class="form-group">
                                                <label for="telefono_movil" class="col-xs-12 col-sm-6 col-md-4 control-label">Recibo de pago de matricula:</label>
                                                <div class="col-xs-12 col-sm-6 col-md-8">
                                                    <input type="file" class="filestyle" data-iconName="glyphicon-inbox">
                                                    <p class="help-block">Selecciona tu archivo del recibo de pago de matricula</p>
                                                </div>
                                            </div>
                                        </fieldset>
                                        <div class="form-group">
                                            <div id="botones">
                                                <button class="btn btn-danger" id="recuperar" type="submit">Guardar</button>
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
                <p>Desarrollado por <strom><a href="#">Megaterios</a></strong></p>
            </footer>

        </div>
    </body>
</html>