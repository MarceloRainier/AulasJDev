<jsp:useBean id="calcula" class="beans.BeanCursoJsp"
	type="beans.BeanCursoJsp" scope="page" />

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Acesso liberado</title>
<link rel="stylesheet" href="resources/css/cadastro.css">
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
</head>
<body>

	<jsp:setProperty property="*" name="calcula" />



	<div class="container">
		<table class="table">
			<thead>
				<tr class="table-active text-center">
					<td colspan="2"><h3>Acesso concedido ao sistema em JSP</h3></td>
				</tr>
				<tr>
					<td>Cadastro de usuários</td>
					<td class="text-center"><a href="salvarUsuario?acao=listartodos"> <img
							src="resources/img/user_add.png" alt="Cadastrar usuário"
							title="Cadastrar usuário" width="20px" height="20px">
					</a></td>
				</tr>
				<tr>
					<td>Cadastro de produtos</td>
					<td class="text-center"><a href="salvarProduto?acao=listartodos"><img
							width="20px" height="20px" title="Cadastrar produto"
							alt="Cadastrar produto" src="resources/img/compras.png">
					</a></td>
				</tr>
			</thead>
		</table>
	</div>
</body>
</html>