<%@page import="com.swii5.prova.Menu" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <link href="/Prova/assets/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="/Prova/assets/css/bootstrap-responsive.css" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

    <head>

        <title>Cadastrar Venda</title>
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
        <div class="container">
            <div class="row-fulid">
                <h1>Cadastrar Venda</h1>
                
                <form class="needs-validation" action='/Prova/Novo' method='post'>
                    Valor: <input class="form-control" type="number" step="0.01" name="valor" required/><br/>
                    Dia: <input class="form-control" type="date" name="dia" required/><br/>
                    ID do Cliente: <input class="form-control" type="number" name="idc" required/><br/>
                    ID do Vendedor: <input class="form-control" type="number" name="idv" required/><br/>
                    <input name="tipo" type="hidden" value="Venda">
                    <input class="btn btn-primary btn-md btn-block cor" type="submit" value="Enviar"/>
                </form>
            </div>
        </div>
        <!------------- Scripts -------------->

        <script src="http://code.jquery.com/jquery-latest.js"></script>
        <script src="/Prova/assets/js/bootstrap.min.js"></script>
    </body>
</html>
