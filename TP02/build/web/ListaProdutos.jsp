<%-- 
    Document   : ListaProdutos
    Created on : 16/05/2021, 12:09:31
    Author     : Bruno
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="Package.Conn" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="assets/css/bootstrap-responsive.css" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista Produtos</title>
    </head>
    <body>
        <!------------- Menu -------------->

        <nav class="navbar navbar-expand-lg navbar-dark cor">
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo03" aria-controls="navbarTogglerDemo03" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarTogglerDemo03" >
                <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
                    <li class="nav-item">
                        <a class="nav-link active" href="/TP02">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="NovoProduto.html">Novo Produto</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="ListaProdutos.jsp">Lista Produtos</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="Creditos.html">Créditos</a>
                    </li>
                </ul>

            </div>
        </nav>

        <!------------- Corpo -------------->
        <div class="container">
            <div class="row-fulid">
                <%
                    try {
                        Conn conn = new Conn();

                        ResultSet rs = conn.select();

                        if (rs != null) {
                            out.println("<h1>Produtos</h1>"
                                      + "<table class='table table-bordered table-striped'align='center' border='1'>"
                                      + "   <thead style='border:none'>"
                                      + "       <tr align='center'>"
                                      + "           <th scope='col'>ID</th>"
                                      + "           <th scope='col'>Nome</th>"
                                      + "           <th scope='col'>Unidade</th>"
                                      + "           <th scope='col'>Descrição</th>"
                                      + "           <th scope='col'>Quantidade</th>"
                                      + "           <th scope='col'>Preço Máximo</th>"
                                      + "       </tr>"
                                      + "   </thead>"
                                      + "   <tbody>");

                            while (rs.next()) {
                                out.println("<tr align='center'>"
                                          + "   <th scope='row'>" + rs.getString(1) + "</th>"
                                          + "   <td>" + rs.getString(2) + "</td>"
                                          + "   <td>" + rs.getString(3) + "</td>"
                                          + "   <td>" + rs.getString(4) + "</td>"
                                          + "   <td>" + rs.getString(5) + "</td>"
                                          + "   <td>" + rs.getString(6) + "</td>"
                                          + "   <td><a href='AlterarProduto.jsp?id=" + rs.getString(1) + "'>Alterar Produto</a></td>"
                                          + "   <td><a href='Deletar?id=" + rs.getString(1) + "'>Deletar Produto</a></td>"
                                          + "</tr>");
                            }

                            conn.close();

                            out.println("   </tbody>"
                                    + "</table>");
                        } else {
                            out.println("<h1>Nenhum Produto Cadastrado</h1>");
                        }
                    } catch (Exception e) {
                        out.println("<h1>" + e.getMessage() + "</h1>");
                    }
                %>
            </div>
        </div>
        <!------------- Scripts -------------->

        <script src="http://code.jquery.com/jquery-latest.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
    </body>
</html>
