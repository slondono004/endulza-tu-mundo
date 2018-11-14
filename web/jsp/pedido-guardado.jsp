<%-- 
    Document   : pedido-guardado.jsp
    Created on : 13/11/2018, 03:41:34 PM
    Author     : Usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
<%@page import="java.util.List" %>
<%@page import="modelos.Pedido" %>
<%
List<Pedido> pedidos = (List<Pedido>)request.getAttribute("pedidos");
%>
        <h1>Hemos tomado su pedido!</h1>
        <table border="1">
            <thead>
                <tr>
                    <th>relleno</th>
                    <th>persona</th>
                    <th>opcion</th>
                    <th>sabor</th>
                    <th>molde</th>
                    <th>porciones</th>
                    <th>editar</th>
                </tr>
            </thead>
            <tbody>
                <%
                for(Pedido p: pedidos) {%>
                <tr>
                    <td><%= p.relleno %></td>
                    <td><%= p.persona %></td>
                    <td><%= p.opcion %></td>
                    <td><%= p.sabor %></td>
                    <td><%= p.molde %></td>
                    <td><%= p.porciones %></td>
                    <td>editar</td>
                </tr>
                <%
                }%>
            </tbody>
        </table>

    </body>
</html>
