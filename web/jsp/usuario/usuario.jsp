<%-- 
    Document   : usuario
    Created on : 6/10/2014, 08:58:54 PM
    Author     : Manuel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Bienvenido</h1>
        
        <br>
        <% out.print(session.getAttribute("nombre"));
           out.print(" ");
           out.print(session.getAttribute("apellido"));
        %>
    </body>
</html>
