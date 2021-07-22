<%@page import="com.swii5.prova.Menu" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <link href="/Prova/assets/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="/Prova/assets/css/bootstrap-responsive.css" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

    <head>
        <title>Home</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <!------------- Menu -------------->

        <%
            Menu menu = new Menu();

            out.println(menu.Menu());
        %>

        <!------------- Corpo -------------->

        <div class="jumbotron text-center">
            <h1>Trabalho Final</h1>            
        </div>

        <div class="container">
            <div class="row">
                <div class="col-sm-3">
                    <h3>Vendedor</h3>
                    <a href="/Prova/Vendedor/Cadastrar.jsp">Cadastrar</a>
                    <p class="phome">Cadastrar novos vendedores no sistema.</p>
                    <a href="/Prova/Vendedor/Listar.jsp">Listar</a>
                    <p class="phome">Listar vendedores cadastrados no sistema.</p>
                </div>
                <div class="col-sm-3">
                    <h3>Cliente</h3>
                    <a href="/Prova/Cliente/Cadastrar.jsp">Cadastrar</a>
                    <p class="phome">Cadastrar novos clientes no sistema.</p>
                    <a href="/Prova/Cliente/Listar.jsp">Listar</a>
                    <p class="phome">Listar clientes cadastrados no sistema.</p>
                </div>
                <div class="col-sm-3">
                    <h3>Venda</h3>
                    <a href="/Prova/Venda/Cadastrar.jsp">Cadastrar</a>
                    <p class="phome">Cadastrar novas vendedas no sistema.</p>
                    <a href="/Prova/Venda/Listar.jsp">Listar</a>
                    <p class="phome">Listar vendas cadastradas no sistema.</p>
                </div>
                <div class="col-sm-3">
                    <h3>Créditos</h3>
                    <a href="/Prova/Creditos.jsp">Créditos</a>
                    <p class="phome">Responsável pela elaboração do sistema.</p>
                    </li>
                </div>
            </div>
        </div>

        <!------------- Scripts -------------->

        <script src="http://code.jquery.com/jquery-latest.js"></script>
        <script src="/Prova/assets/js/bootstrap.min.js"></script>
    </body>
</html>
