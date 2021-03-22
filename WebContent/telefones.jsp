<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Cadastro de telefones</title>
	<link rel="stylesheet" href="resources/css/cadastro.css">
	<link rel="stylesheet" href="resources/css/bootstrap.min.css">
</head>
<body>
<div> <!-- Barra de navegação -->
	<ul class="nav nav-tabs justify-content-center">
		<li class="nav-item"><a class="nav-link active"
			href="acessoliberado.jsp">Home</a></li>
		<li class="nav-item"><a class="nav-link" href="index.jsp">Sair</a>
		</li>
		<li class="nav-item"><a class="nav-link disabled" href="#">Inativo</a>
		</li>
		<li class="nav-item"><a class="nav-link disabled" href="#">Inativo</a>
		</li>
	</ul>
</div> <!-- Fim da Barra de navegação -->

	<h1 class="text-center">CADASTRO DE TELEFONES</h1>

	<h3 class="text-center" style="color: orange;">${msg}</h3>

	<form action="salvarTelefones" method="post" id="formUser"
		onsubmit="return validarCampos() ? true : false;">
		<ul class="form-style-1">
			<li>
				<table>
					<tr>
						<td>Id do usuário</td>
						<td><input type="text" readonly="readonly" id="user" name="user"
							value="${userEscolhido.id}" class="field-long"></td>
						<td><input type="text" readonly="readonly" id="nome"
							name="nome" value="${userEscolhido.nome}" class="field-long"></td>
					</tr>

					<tr>
						<td>Número</td>
						<td><input type="text" id="numero" name="numero"></td>
						<td><select id="tipo" name="tipo" style="width: 180px;">
								<option>Casa</option>
								<option>Trabalho</option>
								<option>Recados</option>
								<option>Celular</option>
								<option>Outro</option>
						</select></td>

					</tr>
					<tr>
						<td></td>
						<td><input type="submit" value="Salvar"></td>
						<td><input type="submit" value="Voltar" onclick="document.getElementById('formUser').action='salvarTelefones?acao=voltar'"></td>
					</tr>
				</table>
			</li>
		</ul>
	</form>

	<div class="container">
		<table class="table">
			<thead>
				<tr class="table-active text-center">
					<td colspan="13">TELEFONES CADASTRADOS PARA O USUÁRIO</td>
				</tr>
				<tr class="text-center">
					<th scope="col">Id</th>
					<th scope="col">Número</th>
					<th scope="col">Tipo</th>
					<th scope="col">Apagar</th>
				</tr>
			</thead>
			<c:forEach items="${telefones}" var="fone">
				<tr class="text-center">
					<td style="width: 150px"><c:out value="${fone.id}"></c:out></td>
					<td style="width: 150px"><c:out value="${fone.numero}"></c:out></td>
					<td style="width: 150px"><c:out value="${fone.tipo}"></c:out></td>
					<td style="width: 150px"><a
						href="salvarTelefones?user=${fone.usuario}&acao=deleteTelefone&telefoneId=${fone.id}"><img
							src="resources/img/excluir.png" alt="excluir"
							title="Excluir" width="20px" height="20px"></a></td>
				</tr>
			</c:forEach>

		</table>
	</div>
	<script type="text/javascript">
	<!-- função javascript para validar, no lado cliente, o preenchimento dos campos -->
		function validarCampos() {
			if (document.getElementById("numero").value == '') {
				alert('Informe o número do telefone');
				return false;
			} else if(document.getElementById("tipo").value == '') {
				alert('Informe o tipo do telefone');
				return false;
			}
			return true;
		}
	</script>
</body>
</html>