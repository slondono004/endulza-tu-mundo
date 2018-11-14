/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import java.sql.DriverManager;
import java.sql.Connection;
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
import modelos.Molde;
import modelos.Porcion;
import modelos.Sabor;
import modelos.Relleno;

/**
 *
 * @author Usuario
 */
public class creatupastel extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher rd = request.getRequestDispatcher("jsp/creatupastel.jsp");
        List<Sabor> sabores = listaSabores();
        List<Porcion> porciones = listaPorciones();
        List<Molde> moldes = listaMolde();
        List<Relleno> rellenos = listaRelleno();
        request.setAttribute("sabores", sabores);
        request.setAttribute("porciones", porciones);
        request.setAttribute("moldes", moldes);
        request.setAttribute("relleno", rellenos);
         rd.forward(request, response);
    }
    
    List<Sabor> listaSabores() {
        List<Sabor> lista = new ArrayList<>();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            try (Connection conexion = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/endulza_tu_mundo", "root", "")) {
                PreparedStatement ps = conexion.prepareStatement("SELECT * FROM sabor");
                ResultSet resultados = ps.executeQuery();
                while(resultados.next()) {
                    int id = resultados.getInt("idsabor");
                    String nombre = resultados.getString("nombre");
                    Sabor s = new Sabor();
                    s.id = id;
                    s.nombre = nombre;
                    lista.add(s);
                }
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(creatupastel.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }
    
    List<Porcion> listaPorciones() {
        List<Porcion> lista = new ArrayList<>();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            try (Connection conexion = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/endulza_tu_mundo", "root", "")) {
                PreparedStatement ps = conexion.prepareStatement("SELECT * FROM porciones");
                ResultSet resultados = ps.executeQuery();
                while(resultados.next()) {
                    int id = resultados.getInt("idporciones");
                    String cantidad = resultados.getString("cantidad");
                    Porcion p = new Porcion();
                    p.id = id;
                    p.cantidad = cantidad;
                    lista.add(p);
                }
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(creatupastel.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(creatupastel.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }
    List<Molde> listaMolde() {
        List<Molde> lista = new ArrayList<Molde>();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conexion = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/endulza_tu_mundo", "root", "");
            PreparedStatement ps = conexion.prepareStatement("SELECT * FROM molde");
            ResultSet resultados = ps.executeQuery();
            while(resultados.next()) {
                String tipo = resultados.getString("tipo");
                int id = resultados.getInt("idmolde");
                Molde m = new Molde();
                m.id = id;
                m.tipo = tipo;
                lista.add(m);
            }
            conexion.close();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(creatupastel.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(creatupastel.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }
    
     List<Relleno> listaRelleno() {
        List<Relleno> lista = new ArrayList<Relleno>();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conexion = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/endulza_tu_mundo", "root", "");
            PreparedStatement ps = conexion.prepareStatement("SELECT * FROM relleno");
            ResultSet resultados = ps.executeQuery();
            while(resultados.next()) {
                int id = resultados.getInt("idrelleno");
                String relleno = resultados.getString("nombre");
                Relleno r = new Relleno();
                r.id = id;
                r.nombre = relleno;
                lista.add(r);
            }
            conexion.close();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(creatupastel.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(creatupastel.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }
    
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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
}