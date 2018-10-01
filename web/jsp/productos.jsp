<%-- 
    Document   : productos
    Created on : 10/09/2018, 08:38:28 AM
    Author     : Usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">

<head>
    <title>Endulza tu mundo</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="CSS/Form2.css">
    <link rel="stylesheet" href="CSS/menu.css">
    <link rel="stylesheet" href="CSS/animate.css">
    <link rel="shortcut icon" href="IMG/Favicon.png" type="image/x-icon">
</head>

<body>
    <br>
    <div class="menu">
        <a href="inicio" target="ventana">Inicio </a>
        <a href="iniciarsesion" target="ventana">Iniciar sesion </a>
        <a href="creatupastel" target="ventana">Crea tu pastel </a>
        <a href="#" target="ventana">Productos </a>
        <a href="contactenos" target="ventana">Contactenos</a>
    </div>
</br>
    <!--Inicio de formularios -->
    <div class="contenedor-form">
        <h2 class="title animated rubberBand">Productos</h2>
        <div class="formulario">
            <p class="animated bounceIn">Sabor del pastel</p>
            <input type="text" name="sabor" placeholder="vainilla, fresa, chocolate, etc." />
            <p class="animated bounceIn">Precio</p>
            <input type="text" name="porciones" placeholder="$">
            <p class="animated bounceIn">Codigo</p>
            <input type="text" name="molde" placeholder="digite codigo" />
            <button type="button" class="animated zoomInRight">Enviar</button>
        </div>
    </div>
</body>

</html>