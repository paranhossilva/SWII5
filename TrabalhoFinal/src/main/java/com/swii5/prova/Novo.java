/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.swii5.prova;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Bruno
 */
public class Novo extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private Conn conn;

    public void init() {
        String jdbcURL = getServletContext().getInitParameter("jdbcURL");
        String jdbcUsername = getServletContext().getInitParameter("jdbcUsername");
        String jdbcPassword = getServletContext().getInitParameter("jdbcPassword");

        conn = new Conn(jdbcURL, jdbcUsername, jdbcPassword);

    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Novo</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Novo at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
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
        processRequest(request, response);
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

        String tipo = request.getParameter("tipo");
       

        switch (tipo) {
            // <editor-fold desc="Cliente">
            case "Cliente":
                String nome = request.getParameter("nome"),
                cidade = request.getParameter("cidade");
                int grau = Integer.parseInt(request.getParameter("grau"));

                 {
                    try {
                        conn.insert(nome, cidade, grau);
                    }
                    catch (SQLException ex) {} 
                    catch (ClassNotFoundException ex) {}
                }

                break;
            // </editor-fold>

            // <editor-fold desc="Vendedor">
            case "Vendedor":
                nome = request.getParameter("nome");
                cidade = request.getParameter("cidade");
                float comissao = Float.parseFloat(request.getParameter("comissao"));

                 {
                    try {
                        conn.insert(nome, cidade, comissao);
                    }
                    catch (SQLException ex) {}
                    catch (ClassNotFoundException ex) {}
                }

                break;
            // </editor-fold>

            // <editor-fold desc="Venda">
            case "Venda":
                float valor = Float.parseFloat(request.getParameter("valor"));
                String dia = request.getParameter("dia").toString();
                int idC = Integer.parseInt(request.getParameter("idc"));
                int idV = Integer.parseInt(request.getParameter("idv"));

                 {
                    try {
                        conn.insert(valor, dia, idC, idV);
                    } catch (SQLException ex) {} 
                    catch (ClassNotFoundException ex) {}      
                }

                break;
                
            default: 
                break;
                
            // </editor-fold>

        }

        PrintWriter out = response.getWriter();
                        out.println("<html><body><script type='text/javascript'>"
                                + "alert('" + tipo + " Cadastrado Com Sucesso!');"
                                + "location='/Prova';"
                                + "</script></body></html>");
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
