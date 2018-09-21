<%-- 
    Document   : creatupastel
    Created on : 10/09/2018, 08:36:47 AM
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
    <link rel="stylesheet" href="CSS/Form1.css">
    <link rel="stylesheet" href="CSS/menu.css">
    <link rel="stylesheet" href="CSS/animate.css">
    <link rel="shortcut icon" href="IMG/Favicon.png" type="image/x-icon">
</head>

<body>
         <br>
    <div class="menu">
        <a href="inicio" target="ventana">Inicio</a>
        <a href="iniciarsesion" target="ventana">Iniciar sesion</a>
        <a href="#" target="ventana">Crea tu pastel</a>
        <a href="producto" target="ventana">Productos</a>
        <a href="contactenos" target="ventana">Contactenos</a>
    </div>
</br>
<%@page import="java.util.List" %>
<%@page import="modelos.Sabor" %>
<%@page import="modelos.Porcion" %>
<%
List<Sabor> listaSabores = (List<Sabor>)request.getAttribute("sabores");
List<Porcion> listaPorciones = (List<Porcion>)request.getAttribute("porciones");
%>
    <!--Inicio de formularios -->
    <div class="contenedor-form">
        <h2 class="title animated rubberBand">Crea tu pastel</h2>
        <div class="formulario">
            <p class="animated bounceIn">Sabor del pastel</p>
            <select>
                <%
                Sabor sabor;
                for(int i = 0; i < listaSabores.size(); i++){
                    sabor = listaSabores.get(i);%>
                <option value="<%= sabor.nombre %>"><%= sabor.nombre %></option>
                
                <%
                }%>
            </select>
            <p class="animated bounceIn">Cantidad de porciones</p>
            <select>
                <%
                Porcion porcion;
                for(int i = 0; i < listaPorciones.size(); i++) {
                    porcion = listaPorciones.get(i);%>
                    <option value="<%= porcion.cantidad %>"><%= porcion.cantidad %></option>
                <%
                }%>
            </select>
            <p class="animated bounceIn">Tipo de molde</p>
            <input type="text" name="molde" placeholder="Redondo o otro tipo" />
            <p class="animated bounceIn">Relleno</p>
            <select name="relleno" id="relleno">
                <option value="#">Seleccione</option>
                <option value="#">SI</option>
                <option value="#">No</option>
            </select>
            <p class="animated bounceIn">Que sabor de relleno</p>
            <input type="text" name="saborRelleno" placeholder="Fondant, Chantilly, etc." />
            <select name="tpTorta" id="tpTorta">
                <option value="#">Seleccione</option>
                <option value="#">Secas</option>
                <option value="#">Postre</option>
                <option value="#">Refrigerada</option>
            </select>
            <button type="button" class="animated zoomInRight">Crear</button>
        </div>
    </div>
</body>

</html>
