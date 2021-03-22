<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cadastro de Produto</title>
<script src="resources/js/jquery.min.js" type="text/javascript"></script>
<script src="resources/js/jquery.maskMoney.min.js"
	type="text/javascript"></script>

<link rel="stylesheet" href="resources/css/cadastro.css">
<link rel="stylesheet" href="resources/css/bootstrap.min.css">

</head>
<body>

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

	<h1 class="text-center">CADASTRO DE PRODUTOS</h1>

	<h3 class="text-center" style="color: orange;">${msg}</h3>

	<form action="salvarProduto" method="post" id="formProduto"
		onsubmit="return validarCampos() ? true : false">
		<ul class="form-style-1">
			<li>
				<table>
					<tr>
						<td>Id:</td>
						<td><input type="text" readonly="readonly" id="id" name="id"
							value="${produto.id}" class="field-long"></td>
					</tr>
					<tr>
						<td>Nome:</td>
						<td><input type="text" id="nome" name="nome"
							value="${produto.nome}" class="field-long"></td>
					</tr>
					<tr>
						<td>Quantidade:</td>
						<td><input type="number" id="quantidade" name="quantidade"
							value="${produto.quantidade}" class="field-long"></td>
					</tr>
					<tr>
						<td>Valor:</td>
						<td><input type="text" data-symbol="R$ " data-thousands="."
							data-decimal="," id="valor" name="valor"
							value="${produto.valorEmTexto}" class="field-long"></td>
					</tr>

					<tr>
						<td>Categoria</td>
						<td><select id="categorias" name="categoria_id">
								<c:forEach items="${categorias}" var="cat">
									<option value="${cat.id}" id="${cat.id}"
										<c:if test="${cat.id == produto.categoria_id}">
											<c:out value="selected=selected"/>								
										</c:if>>${cat.nome}
									</option>

								</c:forEach>
						</select></td>
					</tr>

					<tr>
						<td></td>
						<td><input type="submit" value="Salvar"> <input
							type="submit" value="Cancelar"
							onclick="document.getElementById('formProduto').action = 'salvarProduto?acao=reset'"></td>
					</tr>

				</table>
			</li>
		</ul>
	</form>

	<div class="container">
		<table class="table">
			<thead>
				<tr class="table-active text-center">
					<td colspan="6">PRODUTOS CADASTRADOS</td>
				</tr>
				<tr class="text-center">
					<th scope="col">Id</th>
					<th scope="col">Nome</th>
					<th scope="col">Quantidade</th>
					<th scope="col">Valor</th>
					<th scope="col">Apagar</th>
					<th scope="col">Editar</th>
				</tr>
			</thead>
			<c:forEach items="${produtos}" var="produto">
				<tr class="text-center">
					<td style="width: 150px"><c:out value="${produto.id}"></c:out></td>
					<td style="width: 150px"><c:out value="${produto.nome}"></c:out></td>
					<td style="width: 150px"><c:out value="${produto.quantidade}"></c:out></td>
					<td style="width: 150px"><fmt:formatNumber type="number"
							maxFractionDigits="2" value="${produto.valor}"></fmt:formatNumber></td>
					<td style="width: 150px"><a
						href="salvarProduto?acao=delete&produto=${produto.id}"><img
							src="resources/img/excluir.png" alt="Excluir" width="20px"
							height="20px" onclick="return confirm('Confirma a exclusão?')"></a></td>
					<td style="width: 150px"><a
						href="salvarProduto?acao=editar&produto=${produto.id}"><img
							src="resources/img/editar.png" alt="Editar" width="20px"
							height="20px"></a></td>
				</tr>
			</c:forEach>

		</table>
	</div>
	<script type="text/javascript">
	<!-- função javascript para validar, no lado cliente, o preenchimento dos campos -->
		function validarCampos() {
			if (document.getElementById("nome").value == '') {
				alert('Informe o nome do produto');
				return false;
			} else if (document.getElementById("quantidade").value == '') {
				alert('Informe a quantidade do produto');
				return false;
			} else if (document.getElementById("valor").value == '') {
				alert('Informe o valor do produto');
				return false;
			}
			return true;
		}
	</script>
</body>
<script>
	$(function() {
		$('#valor').maskMoney();
	})
</script>

</html>