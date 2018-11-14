/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelos.Producto;

/**
 *
 * @author Usuario
 */
public class productoControl extends HttpServlet {

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher rd = request.getRequestDispatcher("jsp/productos.jsp");
        request.setAttribute("Productos", listaProductos());
        rd.forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher rd = request.getRequestDispatcher("jsp/productos.jsp");
        String sabor = request.getParameter("sabor");
        String precio = request.getParameter("precio");
        String codigos = request.getParameter("codigos");
        int precioN = Integer.parseInt(precio);
        guardarProducto(sabor, precioN, codigos);
        request.setAttribute("Productos", listaProductos());
        rd.forward(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private void guardarProducto(String sabor, int precio, String codigos) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/endulza_tu_mundo", "root", "");
            PreparedStatement ps = conexion.prepareStatement("INSERT INTO `producto` (`sabor`, `precio`, codigos) VALUES (?, ?, ?)");
            ps.setString(1, sabor);
            ps.setInt(2, precio);
            ps.setString(3, codigos);
            ps.execute();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(productoControl.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(productoControl.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private List <Producto> listaProductos() {
        List <Producto> listaProductos = new ArrayList<Producto>();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/endulza_tu_mundo", "root", "");
            PreparedStatement ps = conexion.prepareStatement("SELECT * FROM producto");
            ResultSet resultados = ps.executeQuery();
            while (resultados.next()) {
                int id = resultados.getInt("idproducto");
                String sabor = resultados.getString("sabor");
                int precio = resultados.getInt("precio");
                String codigos = resultados.getString("codigos");
                Producto p = new Producto();
                p.id = id;
                p.sabor = sabor;
                p.precio = precio;
                p.codigos = codigos;
                listaProductos.add(p);
            }
            conexion.close();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(productoControl.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(productoControl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listaProductos;
    }

}
