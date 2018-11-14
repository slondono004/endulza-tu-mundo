/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
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
import modelos.Porcion;

/**
 *
 * @author Usuario
 */
public class Pedido extends HttpServlet {


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
        String sabor = request.getParameter("sabor");
        String porciones = request.getParameter("porciones");
        String molde = request.getParameter("molde");
        String relleno = request.getParameter("relleno");
        String tpTorta = request.getParameter("tpTorta");
        
        guardarPedido(sabor, porciones, molde, relleno, tpTorta);
        
        RequestDispatcher rd = request.getRequestDispatcher("jsp/pedido-guardado.jsp");
        request.setAttribute("pedidos", todosLosPedidos());
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

    private void guardarPedido(String sabor, String porciones, String molde, String relleno, String tpTorta) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conexion = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/endulza_tu_mundo", "root", "");
            PreparedStatement ps = conexion.prepareStatement("INSERT INTO `endulza_tu_mundo`.`pedido` (`relleno`, `persona`, `opcion`, `sabor`, `molde`, `porciones`) VALUES (?, ?, ?, ?, ?, ?);");
            ps.setString(1, relleno);
            ps.setInt(2, 1);
            ps.setString(3, tpTorta);
            ps.setString(4, sabor);
            ps.setString(5, molde);
            ps.setString(6, porciones);
            ps.execute();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Pedido.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Pedido.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private Object todosLosPedidos() {
        List<modelos.Pedido> lista = new ArrayList<>();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            try (Connection conexion = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/endulza_tu_mundo", "root", "")) {
                PreparedStatement ps = conexion.prepareStatement("SELECT * FROM pedido");
                ResultSet resultados = ps.executeQuery();
                while(resultados.next()) {
                    //`relleno`, `persona`, `opcion`, `sabor`, `molde`, `porciones`
                    String relleno = resultados.getString("relleno");
                    int persona = resultados.getInt("persona");
                    int opcion = resultados.getInt("opcion");
                    int sabor = resultados.getInt("sabor");
                    int molde = resultados.getInt("molde");
                    int porciones = resultados.getInt("porciones");
                    modelos.Pedido p = new modelos.Pedido();
                    p.relleno = relleno;
                    p.persona = persona;
                    p.opcion = opcion;
                    p.sabor = sabor;
                    p.molde = molde;
                    p.porciones = porciones;
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
}
