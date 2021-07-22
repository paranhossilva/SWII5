<%-- 
    Document   : Alterar
    Created on : 20/07/2021, 13:27:07
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
        <title>Alterar Cliente</title>
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
                <h1>Alterar Vendedor</h1>
                
                <form class="needs-validation" action='/Prova/Alterar' method='post'>
                    <%
                        try {String jdbcURL = getServletContext().getInitParameter("jdbcURL");
                        String jdbcUsername = getServletContext().getInitParameter("jdbcUsername");
                        String jdbcPassword = getServletContext().getInitParameter("jdbcPassword");

                        Conn conn = new Conn(jdbcURL, jdbcUsername, jdbcPassword);

                            int id = Integer.parseInt(request.getParameter("id"));

                            ResultSet rs = conn.select("vendedor",id);
                            
                            rs.next();

                            out.println("Nome: <input class='form-control' type='text' name='nome' maxlength='30' value='" + rs.getString(2) + "' required/><br/>"
                                      + "Cidade: <input class='form-control' type='text' name='cidade' maxlength='15' value='" + rs.getString(3) + "' required/><br/>"
                                      + "Grau: <input class='form-control' type='number' name='grau' value='" + rs.getString(4) + "' required/><br/>"
                                      + "<input type='hidden' name='id' value='" + rs.getString(1) + "'>");
                        } catch (Exception e) {
                            out.println("<h1>" + e.getMessage() + "</h1>");
                        }
                    %>
                    <input type="hidden" name="tipo" value="Vendedor">
                    <input class="btn btn-primary btn-md btn-block cor" type="submit" value="Enviar"/>
                </form>
            </div>
        </div>
        <!------------- Scripts -------------->

        <script src="http://code.jquery.com/jquery-latest.js"></script>
        <script src="/Prova/assets/js/bootstrap.min.js"></script>
    </body>
</html>
