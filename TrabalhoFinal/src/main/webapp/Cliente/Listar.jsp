<%-- 
    Document   : ListCliente
    Created on : 17/07/2021, 10:37:48
    Author     : Bruno
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="com.swii5.prova.Conn" %>
<%@page import="com.swii5.prova.Menu" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <link href="/Prova/assets/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="/Prova/assets/css/bootstrap-responsive.css" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista Cliente</title>
    </head>
    <body>
        <!------------- Menu -------------->

       <%            
            Menu menu = new Menu();
            
            out.println(menu.Menu());
        %>
        
        <!------------- Corpo -------------->
        <div class="container">
            <div class="row-fulid">
                <%
                    try {
                        String jdbcURL = getServletContext().getInitParameter("jdbcURL");
                        String jdbcUsername = getServletContext().getInitParameter("jdbcUsername");
                        String jdbcPassword = getServletContext().getInitParameter("jdbcPassword");

                        Conn conn = new Conn(jdbcURL, jdbcUsername, jdbcPassword);

                        ResultSet rs = conn.select("cliente");

                        if (rs != null) {
                            out.println("<h1>Clientes</h1>"
                                      + "<table class='table table-bordered table-striped'align='center' border='1'>"
                                      + "   <thead style='border:none'>"
                                      + "       <tr align='center'>"
                                      + "           <th scope='col'>ID</th>"
                                      + "           <th scope='col'>Nome</th>"
                                      + "           <th scope='col'>Cidade</th>"
                                      + "           <th scope='col'>Grau</th>"
                                      + "       </tr>"
                                      + "   </thead>"
                                      + "   <tbody>");

                            while (rs.next()) {
                                out.println("<tr align='center'>"
                                          + "   <th scope='row'>" + rs.getString(1) + "</th>"
                                          + "   <td>" + rs.getString(2) + "</td>"
                                          + "   <td>" + rs.getString(3) + "</td>"
                                          + "   <td>" + rs.getString(4) + "</td>"
                                          + "   <td><a href='/Prova/Cliente/Alterar.jsp?id=" + rs.getString(1) + "'>Alterar</a></td>"
                                          + "   <td><a href='/Prova/Deletar?tipo=Cliente&id=" + rs.getString(1) + "'>Deletar</a></td>"
                                          + "</tr>");
                            }

                            conn.close();

                            out.println("   </tbody>"
                                    + "</table>");
                        } else {
                            out.println("<h1>Nenhum Cliente Cadastrado</h1>");
                        }
                    } catch (Exception e) {
                        out.println("<h1>" + e.getMessage() + "</h1>");
                    }
                %>
            </div>
        </div>
        <!------------- Scripts -------------->

        <script src="http://code.jquery.com/jquery-latest.js"></script>
        <script src="/Prova/assets/js/bootstrap.min.js"></script>
    </body>
</html>
