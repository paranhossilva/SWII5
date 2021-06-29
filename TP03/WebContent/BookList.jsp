<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>    
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="assets/css/bootstrap-responsive.css" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

<head>
	<title>Books Store Application</title>
</head>
<body>
    <!------------- Menu -------------->

        <nav class="navbar navbar-expand-lg navbar-dark" style="background-color:deeppink">
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo03" aria-controls="navbarTogglerDemo03" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarTogglerDemo03" >
                <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
                    <li class="nav-item">
                        <a class="nav-link active" href="new">Novo Livro</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="list">Listar Livros</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="creditos">Créditos</a>
                    </li>
                </ul>

            </div>
        </nav>
    
    <!------------- Corpo -------------->
	
		<div class="container">
    <div class="row-fulid">
        <h1 align="center">Lista de livros</h1>
        <table class='table table-bordered table-striped'align='center' border='1'>
            <tr align='center'>
                <th scope='col'>ID</th>
                <th scope='col'>Título</th>
                <th scope='col'>Autor</th>
                <th scope='col'>Preço</th>
                <th scope='col' colspan="2">Ações</th>
            </tr>
            <c:forEach var="book" items="${listBook}">
                <tr>
                    <td align="center"><c:out value="${book.id}" /></td>
                    <td><c:out value="${book.title}" /></td>
                    <td><c:out value="${book.author}" /></td>
                    <td align="center"><c:out value="${book.price}"/></td>
                    <td align="center"><a href="edit?id=<c:out value='${book.id}' />">Editar</a></td>
                    <td align="center"><a href="delete?id=<c:out value='${book.id}' />">Excluir</a> </td>
                </tr>
            </c:forEach>
        </table>
    </div>
                </div>
    <!------------- Scripts -------------->

        <script src="http://code.jquery.com/jquery-latest.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
</body>
</html>
