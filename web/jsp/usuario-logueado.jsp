<%-- 
    Document   : usuario-logueado
    Created on : 21/09/2018, 09:00:19 AM
    Author     : Usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Respuesta</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="CSS/animate.css">
    <link rel="stylesheet" href="CSS/slider.css">
    <link rel="stylesheet" href="CSS/form3.css">
    <link rel="shortcut icon" href="IMG/Favicon.png" type="image/x-icon">
    </head>
    <body>
        <center>
        <div class="contenedor">
            <div class="elemento">
                <h2 class="title animated rubberBand">Respuesta</h2>
                 <p><%= request.getAttribute("mensaje")%></p>
            </div>
            <input type="submit" onclick="history.back()" name="volver inicio" value="volver inicio">
        </center>
            
    </body>
</html>
