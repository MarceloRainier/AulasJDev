<jsp:useBean id="calcula" class="beans.BeanCursoJsp" scope="page" />

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="myprefix" uri="WEB-INF/testetag.tld"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Página Inicial</title>

<link rel="stylesheet" href="resources/css/estilo.css">

</head>
<body>
	<div class="login-page">
		<div style="text-align: center;"> <!-- Inicio da DIV de cabeçalho -->
			<h3 >Projeto Didático</h3>
			<h4>JSP + Servlet + JDBC</h4>
		</div><!-- Fim da DIV de cabeçalho -->
		<div class="form">
			<form action="LoginServlet" method="post" class="login-form">
				Login: <input type="text" id="login" name="login"> <br />
				Senha: <input type="password" id="senha" name="senha"> <br />
				<button type="submit" value="Logar">LOGAR</button>

			</form>
		</div>
		<h3 style="text-align: center;">Formação Java Web</h3>
	</div>
</body>
</html>