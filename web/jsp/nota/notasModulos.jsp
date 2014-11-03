<%-- 
    Document   : notasModulos
    Created on : 23/10/2014, 03:26:46 PM
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
    <!-- Core CSS - Include with every page -->
    <link href="../../css/bootstrap.min.css" rel="stylesheet">
    <link href="../../font-awesome/css/font-awesome.css" rel="stylesheet">

    <!-- Page-Level Plugin CSS - Dashboard -->
    <link href="../../css/plugins/morris/morris-0.4.3.min.css" rel="stylesheet">
    <link href="../../css/plugins/timeline/timeline.css" rel="stylesheet">

    <!-- SB Admin CSS - Include with every page -->
    <link href="../../css/sb-admin.css" rel="stylesheet">

    <!--Hojas de estilo-->
    <link href="../../css/style.css" rel="stylesheet">
    <!--Iconos-->
    <link href="../../img/favicon.ico" rel="shortcut icon">
</head>
<body>
    <div class="container">
        <header>
            <figure>
                <img alt="CURSOFT" class="img-responsive" id="banner_cursoft" src="../../img/banne_cursoft.png">
            </figure>
        </header>

        <section>
            <div class="row">
                <div class="col-xs-12 col-sm-9 col-md-9 col-lg-9" id="contenido">
                    <ol class="breadcrumb">
                        <li><a href="../docente/cargarProfesor.jsp">Inicio</a></li>
                        <li><a href="#">Docente</a></li>
                    </ol>
                    <div class="col-xs-offset-3 col-xs-10" id="contenedor">
                        <div id="subtitulo">
                            <h2>Listado de Estudiantes</h2>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <strong> <% out.println(session.getAttribute("nombreModulo")); %> </strong>
                            </div>
                            <form action="administrarNotas.jsp" class="form-horizontal" method="get" role="form">
                            <div class="panel-body">
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>Codigo</th>
                                                <th>Nombre</th>
                                                <th>Nota</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <% out.println(session.getAttribute("estudiantesModulo")); %>
                                        </tbody>
                                    </table>
                                    
                                </div>
                            </div>
                        </div>
                        
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-xs-offset-4 col-xs-4 text-center">
                                        <button class="btn btn-danger" id="cancelar" name="requerimiento" value="Guardar" type="submit">Guardar Cambios</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                        <form>
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
