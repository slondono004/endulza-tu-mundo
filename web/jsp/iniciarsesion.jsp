<%-- 
    Document   : iniciarsesion
    Created on : 10/09/2018, 08:37:36 AM
    Author     : Usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">

<head>
    <title>Registro</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="CSS/animate.css">
    <link rel="stylesheet" href="CSS/slider.css">
    <link rel="stylesheet" href="CSS/menu.css">
    <link rel="stylesheet" href="CSS/sesion.css">
    <link rel="shortcut icon" href="IMG/Favicon.png" type="image/x-icon">
</head>

<body>

    <div class="slider">

        <br>
        <div class="menu">
            <a href="inicio" target="ventana">Inicio</a>
            <a href="#" target="ventana">Iniciar sesion</a>
            <a href="creatupastel" target="ventana">Crea tu pastel</a>
            <a href="producto" target="ventana">Productos</a>
            <a href="contactenos" target="ventana">Contactenos</a>
        </div>
        </br>
        <div class="carga"></div>
        <!-- Contenido de todo el formulario -->
        <div class="contenido">
            <div class="contenedor-form">
                <div class="toggle">
                    <span>Registrate</span>
                </div>
                <div class="formulario">
                    <h3 class="animated rubberBand">Endulza tu mundo</h3>
                    <img src="IMG/Logo.png" alt="Nombre de empresa" class="logo">
                    <h2 class="animated bounceIn">Iniciar Sesion</h2>
                    <form action="login" method="post">
                        <input name="email" type="email" placeholder="Correo electronico" required />
                        <input name="password" type="password" placeholder="Contraseña" required />
                        <input type="submit" value="Iniciar Sesion" />
                    </form>
                </div>
                <div class="formulario">
                    <h2 class="animated wobble">Crea tu Cuenta</h2>
                    <form action="registro" method="post">
                        <input type="text" placeholder="Nombre" required />
                        <input type="text" placeholder="Apellido" required />
                        <input type="email" placeholder="Correo Electronico" required />
                        <input type="password" placeholder="Contraseña" required />
                        <input type="password" placeholder="Confirmar contraseña" required />
                        <input type="submit" value="Registrarse" />
                    </form>
                </div>
            </div>
        </div>
    </div>
    <script src="JS/jquery-3.3.1.min.js"></script>
    <script src="JS/sesion.js"></script>
</body>

</html>
