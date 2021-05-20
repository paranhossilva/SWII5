<%-- 
    Document   : AlterarProduto
    Created on : 17/05/2021, 12:03:04
    Author     : Bruno
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="Package.Conn"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="assets/css/bootstrap-responsive.css" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alterar Produto</title>
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
                <form class="needs-validation" action='Alterar' method='post'>
                    <%
                        try {
                            Conn conn = new Conn();

                            int id = Integer.parseInt(request.getParameter("id"));

                            ResultSet rs = conn.select(id);
                            rs.next();

                            out.println("Nome: <input class='form-control' type='text' name='nome' value='" + rs.getString(2) + "' required/><br/>"
                                    + "Unidade: <input class='form-control' type='number' name='unidade' value='" + rs.getString(3) + "' required/><br/>"
                                    + "Descrição: <input class='form-control' type='text' name='desc' value='" + rs.getString(4) + "' required/><br/>"
                                    + "Quantidade Prevista: <input class='form-control' type='number' name='qtd' value='" + rs.getString(5) + "' required/><br/>"
                                    + "Preço Máximo: <input class='form-control' type='number' step='0.01' name='preco' value='" + rs.getString(6) + "' required/><br/>"
                                    + "<input type='hidden' name='id' value='" + rs.getString(1) + "'>");
                        } catch (Exception e) {
                            out.println("<h1>" + e.getMessage() + "</h1>");
                        }
                    %>
                    <input class="btn btn-primary btn-md btn-block" type="submit" value="Enviar"/>
                </form>
            </div>
        </div>
        <!------------- Scripts -------------->

        <script src="http://code.jquery.com/jquery-latest.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
    </body>
</html>
