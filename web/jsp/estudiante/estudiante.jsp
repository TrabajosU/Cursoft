<%-- 
    Document   : estudiante
    Created on : 27/09/2014, 08:37:49 PM
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
                                    <p><strong>¡Mensaje!</strong></p>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-offset-1 col-xs-10" id="subtitulo">
                                <h2>Administrar Estudiante</h2>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-offset-1 col-xs-10" id="contenedor">
                                <div class="row" id="formulario">
                                    <form action="#" class="form-horizontal" method="post" role="form">
                                        <fieldset>
                                            <legend>Datos de Usuario</legend>
                                            <div class="form-group">
                                                <label for="correo" class="col-xs-12 col-sm-6 col-md-4 control-label">Correo electrónico:</label>
                                                <div class="col-xs-12 col-sm-6 col-md-8">
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><span class="glyphicon glyphicon-envelope"></span></span>
                                                        <input class="form-control" id="correo" placeholder="abdul.laiseca@gmail.com" type="text" enabled>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-xs-12 col-sm-6 col-md-4 control-label" for="contraseña" >Contraseña:</label>
                                                <div class="col-xs-12 col-sm-6 col-md-8">
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
                                                        <input class="form-control" id="contraseña" placeholder="********" type="password" enabled>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-xs-12 col-sm-6 col-md-4 control-label" for="confirmar_contraseña">Confirmar contraseña:</label>
                                                <div class="col-xs-12 col-sm-6 col-md-8">
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
                                                        <input class="form-control" id="confirmar_contraseña" placeholder="********" type="password" enabled>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="nombres" class="col-xs-12 col-sm-6 col-md-4 control-label">Nombres:</label>
                                                <div class="col-xs-12 col-sm-6 col-md-8">
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
                                                        <input class="form-control" id="nombres" placeholder="Abdul Fabian" type="text" enabled>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="apellidos" class="col-xs-12 col-sm-6 col-md-4 control-label">Apellidos:</label>
                                                <div class="col-xs-12 col-sm-6 col-md-8">
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
                                                        <input class="form-control" id="apellidos" placeholder="Laiseca Candelo" type="text" enabled>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="tipo_documento" class="col-xs-12 col-sm-6 col-md-4 control-label">Tipo de documento:</label>
                                                <div class="col-xs-12 col-sm-6 col-md-8">
                                                    <select class="form-control" id="tipo_documento" enabled>
                                                        <option value="aspirante">Cédula de ciudadania</option>
                                                        <option value="estudiante">Tarjeta de identidad</option>
                                                        <option value="docente">Pasaporte</option>
                                                    </select>
                                                 </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="numero_documento" class="col-xs-12 col-sm-6 col-md-4 control-label">Número de documento:</label>
                                                <div class="col-xs-12 col-sm-6 col-md-8">
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><span class="glyphicon glyphicon-barcode"></span></span>
                                                        <input class="form-control" id="numero_documento" placeholder="13278413" type="text" enabled>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="fecha_nacimiento" class="col-xs-12 col-sm-6 col-md-4 control-label">Fecha de nacimiento:</label>
                                                <div class="col-xs-12 col-sm-6 col-md-8">
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                                                        <input class="form-control" id="fecha_nacimiento" placeholder="16/04/1984" type="text" enabled>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="direccion_residencia" class="col-xs-12 col-sm-6 col-md-4 control-label">Dirección de residencia:</label>
                                                <div class="col-xs-12 col-sm-6 col-md-8">
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><span class="glyphicon glyphicon-home"></span></span>
                                                        <input class="form-control" id="direccion_residencia" placeholder="Cl 21A 11 48 Br Alfonso Lopez" type="text" enabled>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="telefono_residencia" class="col-xs-12 col-sm-6 col-md-4 control-label">Teléfono de recidencia:</label>
                                                <div class="col-xs-12 col-sm-6 col-md-8">
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><span class="glyphicon glyphicon-phone-alt"></span></span>
                                                        <input class="form-control" id="telefono_residencia" placeholder="5822276" type="text" enabled>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="telefono_movil" class="col-xs-12 col-sm-6 col-md-4 control-label">Teléfono móvil:</label>
                                                <div class="col-xs-12 col-sm-6 col-md-8">
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><span class="glyphicon glyphicon-phone"></span></span>
                                                        <input class="form-control" id="telefono_movil" placeholder="3137496602" type="text" enabled>
                                                    </div>
                                                </div>
                                            </div>
                                        </fieldset>
                                        <fieldset>
                                            <legend>Datos de Aspirante</legend>
                                            <div class="form-group">
                                                <label for="codigo" class="col-xs-12 col-sm-6 col-md-4 control-label">Código:</label>
                                                <div class="col-xs-12 col-sm-6 col-md-8">
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><span class="glyphicon glyphicon-qrcode"></span></span>
                                                        <input class="form-control" id="telefono_movil" placeholder="1150789" type="text" enabled>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="promedio_ponderado" class="col-xs-12 col-sm-6 col-md-4 control-label">Promedio ponderado:</label>
                                                <div class="col-xs-12 col-sm-6 col-md-8">
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><span class="glyphicon glyphicon-stats"></span></span>
                                                        <input class="form-control" id="telefono_movil" placeholder="4.2" type="text" enabled>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="semestre_de_terminacion_de_materias" class="col-xs-12 col-sm-6 col-md-4 control-label">Semestre de terminación de materias:</label>
                                                <div class="col-xs-12 col-sm-6 col-md-8">
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><span class="glyphicon glyphicon-list-alt"></span></span>
                                                        <input class="form-control" id="telefono_movil" placeholder="02/2015" type="text" enabled>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="recibo_de_terminacion_de_materias" class="col-xs-12 col-sm-6 col-md-4 control-label">Recibo de terminación de materias:</label>
                                                <div class="col-xs-12 col-sm-6 col-md-8">
                                                    <input type="file" class="filestyle" data-iconName="glyphicon-inbox" placeholder="recibo_terminacion_materias.pdf" enabled>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="recibo_de_paz_y_salvo" class="col-xs-12 col-sm-6 col-md-4 control-label">Recibo de paz y salvo:</label>
                                                <div class="col-xs-12 col-sm-6 col-md-8">
                                                    <input type="file" class="filestyle" data-iconName="glyphicon-inbox" placeholder="recibo_paz_y_salvo.pdf" enabled>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="recibo_de_pago_de_inscripcion" class="col-xs-12 col-sm-6 col-md-4 control-label">Recibo de pago de inscripción:</label>
                                                <div class="col-xs-12 col-sm-6 col-md-8">
                                                    <input type="file" class="filestyle" data-iconName="glyphicon-inbox" placeholder="recibo_pago_inscripcion.pdf" enabled>
                                                </div>
                                            </div>
                                        </fieldset>
                                        <fieldset>
                                            <legend>Datos de Estudiante</legend>
                                                <div class="form-group">
                                                    <div class="table-responsive">
                                                        <table class="table table-hover">
                                                            <thead>
                                                                <tr>
                                                                    <th># Módulo</th>
                                                                    <th>Nombre</th>
                                                                    <th>Profesor</th>
                                                                    <th>Nota</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <tr>
                                                                    <td>1</td>
                                                                    <td><a href="#">Arquitectura del Negocio</a></td>
                                                                    <td><a href="#">Marco Adarme</a></td>
                                                                    <td>3.5</td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                    <td></td>
                                                                    <td><strong>Definitiva:</strong></a></td>
                                                                    <td>3.5</td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                        </fieldset>
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
