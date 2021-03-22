<%@page import="beans.BeanCursoJsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<!-- Adicionando JQuery -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"
	integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
	crossorigin="anonymous">
	
</script>

<title>Cadastro de usuário</title>

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


	<h1 class="text-center">CADASTRO DE USUÁRIOS</h1>

	<h3 class="text-center" style="color: orange;">${msg}</h3>

	<form action="salvarUsuario" method="post" id="formUser"
		onsubmit="return validarCampos() ? true : false;"
		enctype="multipart/form-data">
		<ul class="form-style-1">
			<li>
				<table>
					<tr>
						<td>Id:</td>
						<td><input type="text" readonly="readonly" id="id" name="id"
							value="${user.id}" class="field-long"></td>
						<td>CEP:</td>
						<td><input type="text" id="cep" name="cep"
							onblur="consultaCep()" value="${user.cep}" class="field-long"
							placeholder="Informe um CEP válido"></td>
					</tr>
					<tr>
						<td>Login:</td>
						<td><input type="text" id="login" name="login"
							value="${user.login}" class="field-long"></td>
						<td>Rua:</td>
						<td><input type="text" id="rua" name="rua"
							value="${user.rua}" class="field-long"></td>
					</tr>
					<tr>
						<td>Senha:</td>
						<td><input type="password" id="senha" name="senha"
							value="${user.senha}" class="field-long"></td>
						<td>Bairro:</td>
						<td><input type="text" id="bairro" name="bairro"
							value="${user.bairro}" class="field-long"
							placeholder="Informe o bairro do usuário"></td>
					</tr>
					<tr>
						<td>Nome:</td>
						<td><input type="text" id="nome" name="nome"
							value="${user.nome}" class="field-long"
							placeholder="Informe o nome do usuário"></td>
						<td>Cidade:</td>
						<td><input type="text" id="cidade" name="cidade"
							value="${user.cidade}" class="field-long"
							placeholder="Informe a cidade"></td>
					</tr>
					<tr>
						<td>Telefone:</td>
						<td><input type="text" id="telefone" name="telefone"
							value="${user.telefone}" class="field-long"></td>
						<td>Estado:</td>
						<td><input type="text" id="estado" name="estado"
							value="${user.estado}" class="field-long"></td>
					</tr>
					<tr>
						<td>IBGE:</td>
						<td><input type="text" id="ibge" name="ibge"
							value="${user.ibge}" class="field-long"></td>

						<td>Ativo</td>
						<td><input type="checkbox" id="ativo" name="ativo"
							<%if (request.getAttribute("user") != null) {

	BeanCursoJsp user = (BeanCursoJsp) request.getAttribute("user");
	if (user.isAtivo()) {
		out.print(" ");
		out.print("checked=\"checked\"");
		out.print(" ");
	}
}%>></td>
					</tr>
					<tr>
						<td>Foto</td>
						<td><input type="file" id="foto" name="foto"></td>
						<td>Sexo</td>
						<td><input type="radio" name="sexo"
							<%if (request.getAttribute("user") != null) {
	BeanCursoJsp user = (BeanCursoJsp) request.getAttribute("user");
	if (user.getSexo().equalsIgnoreCase("masculino")) {
		out.print(" ");
		out.print("checked=\"checked\"");
		out.print(" ");
	}
}%>
							value="masculino"> Masculino </> <input type="radio"
							name="sexo"
							<%if (request.getAttribute("user") != null) {
	BeanCursoJsp user = (BeanCursoJsp) request.getAttribute("user");
	if (user.getSexo().equalsIgnoreCase("feminino")) {
		out.print(" ");
		out.print("checked=\"checked\"");
		out.print(" ");
	}
}%>
							value="feminino"> Feminino </></td>
					</tr>
					<tr>
						<td>Curriculo</td>
						<td><input type="file" id="curriculo" name="curriculo"></td>

						<td>Perfil</td>
						<td><select id="perfil" name="perfil">
								<option value="nao_informado">[----Selecione----]</option>

								<option value="administrador"
									<%if (request.getAttribute("user") != null) {
	BeanCursoJsp user = (BeanCursoJsp) request.getAttribute("user");
	if (user.getPerfil().equalsIgnoreCase("administrador")) {
		out.print(" ");
		out.print("selected=\"selected\"");
		out.print(" ");
	}
}%>>Administrador</option>

								<option value="secretario"
									<%if (request.getAttribute("user") != null) {
	BeanCursoJsp user = (BeanCursoJsp) request.getAttribute("user");
	if (user.getPerfil().equalsIgnoreCase("secretario")) {
		out.print(" ");
		out.print("selected=\"selected\"");
		out.print(" ");
	}
}%>>Secretário(a)</option>

								<option value="gerente"
									<%if (request.getAttribute("user") != null) {
	BeanCursoJsp user = (BeanCursoJsp) request.getAttribute("user");
	if (user.getPerfil().equalsIgnoreCase("gerente")) {
		out.print(" ");
		out.print("selected=\"selected\"");
		out.print(" ");
	}
}%>>Gerente</option>

								<option value="funcionario"
									<%if (request.getAttribute("user") != null) {
	BeanCursoJsp user = (BeanCursoJsp) request.getAttribute("user");
	if (user.getPerfil().equalsIgnoreCase("funcionario")) {
		out.print(" ");
		out.print("selected=\"selected\"");
		out.print(" ");
	}
}%>>Funcionário(a)</option>

						</select></td>
					</tr>

					<tr>
						<td></td>
						<td><input type="submit" value="Salvar"></td>
						<td></td>
						<td><input type="submit" value="Cancelar"
							onclick="document.getElementById('formUser').action = 'salvarUsuario?acao=reset'"></td>
					</tr>

				</table>
			</li>
		</ul>
	</form>

	<form method="post" action="servletPesquisa">
		<ul class="form-style-1">
			<li>
				<table>
					<tr>
						<td>Descrição</td>
						<td><input type="text" id="descricaoconsulta"
							name="descricaoconsulta"></td>
						<td><input type="submit" value="Pesquisar"></td>
					</tr>
				</table>
			</li>
		</ul>
	</form>
	<div class="container">
		<table class="table">
			<thead>
				<tr class="table-active text-center">
					<td colspan="15">USUÁRIOS CADASTRADOS</td>
				</tr>
				<tr class="text-center">
					<th scope="col">Id</th>
					<!-- <th scope="col">Login</th> -->
					<th scope="col">Foto</th>
					<th scope="col">Curriculo</th>
					<th scope="col">Nome</th>
					<th scope="col">Telefone</th>
					<th scope="col">CEP</th>
					<th scope="col">Rua</th>
					<th scope="col">Bairro</th>
					<th scope="col">Cidade</th>
					<th scope="col">Estado</th>
					<th scope="col">IBGE</th>
					<th scope="col">Apagar</th>
					<th scope="col">Editar</th>
					<th scope="col">Telefones</th>
				</tr>
			</thead>
			<c:forEach items="${usuarios}" var="user">

				<tr class="text-center">
					<td style="width: 150px"><c:out value="${user.id}"></c:out></td>
					<c:if test="${user.fotoBase64Miniatura.isEmpty() == false}">
						<!-- <td style="width: 150px"><c:out value="${user.login}"></c:out></td> -->
						<td><a
							href="salvarUsuario?acao=download&tipo=imagem&user=${user.id}"><img
								src='<c:out value="${user.fotoBase64Miniatura}"></c:out>'
								width="32px" height="32px" /></a></td>
					</c:if>
					<c:if test="${user.fotoBase64Miniatura == null}">
						<td><img alt="Imagem user" src="resources/img/userpadrao.png"
							width="32px" height="32px" onclick="alert('Foto não cadastrada')"></td>
					</c:if>
					<c:if test="${user.curriculoBase64.isEmpty() == false}">
						<td><a
							href="salvarUsuario?acao=download&tipo=curriculo&user=${user.id}"><img
								alt="Curriculo" src="resources/img/pdfpadrao.png" width="32px"
								height="32px"></a></td>
					</c:if>
					<c:if test="${user.curriculoBase64 == null}">
						<td><img alt="Curriculo" src="resources/img/pdfpadrao.png"
							width="32px" height="32px"
							onclick="alert('Curriculo em PDF não cadastrado')"></td>
					</c:if>

					<td style="width: 150px"><c:out value="${user.nome}"></c:out></td>
					<td style="width: 150px"><c:out value="${user.telefone}"></c:out></td>
					<td style="width: 150px"><c:out value="${user.cep}"></c:out></td>
					<td style="width: 150px"><c:out value="${user.rua}"></c:out></td>
					<td style="width: 150px"><c:out value="${user.bairro}"></c:out></td>
					<td style="width: 150px"><c:out value="${user.cidade}"></c:out></td>
					<td style="width: 150px"><c:out value="${user.estado}"></c:out></td>
					<td style="width: 150px"><c:out value="${user.ibge}"></c:out></td>
					<td style="width: 150px"><a
						href="salvarUsuario?acao=delete&user=${user.id}"
						onclick="return confirm('Confirma a exclusão?')"><img
							src="resources/img/excluir.png" alt="Excluir" width="20px"
							height="20px"></a></td>
					<td style="width: 150px"><a
						href="salvarUsuario?acao=editar&user=${user.id}"><img
							src="resources/img/editar.png" alt="Editar" width="20px"
							height="20px"></a></td>
					<td style="width: 150px"><a
						href="salvarTelefones?acao=addTelefone&user=${user.id}"><img
							src="resources/img/telefone.png" alt="Telefones"
							title="Telefones" width="20px" height="20px"></a></td>
				</tr>
			</c:forEach>

		</table>
	</div>
	<script type="text/javascript">
	<!-- função javascript para validar, no lado cliente, o preenchimento dos campos -->
		function validarCampos() {
			if (document.getElementById("login").value == '') {
				alert('Informe o login');
				return false;
			} else if (document.getElementById("senha").value == '') {
				alert('Informe a senha');
				return false;
			} else if (document.getElementById("nome").value == '') {
				alert('Informe o nome');
				return false;
			} else if (document.getElementById("telefone").value == '') {
				alert('Informe o telefone');
				return false;
			} else if (document.getElementById("cep").value == '') {
				alert('Informe o CEP');
				return false;
			}

			return true;
		}

		function consultaCep() {
			var cep = $("#cep").val();

			//Consulta o webservice viacep.com.br/
			$.getJSON("https://viacep.com.br/ws/" + cep + "/json/?callback=?",
					function(dados) {

						if (!("erro" in dados)) {
							$("#rua").val(dados.logradouro);
							$("#bairro").val(dados.bairro);
							$("#cidade").val(dados.localidade);
							$("#estado").val(dados.uf);
							$("#ibge").val(dados.ibge);

						} //end if.
						else {
							$("#cep").val('');
							$("#rua").val('');
							$("#bairro").val('');
							$("#cidade").val('');
							$("#uf").val('');
							$("#ibge").val('');
							//CEP pesquisado não foi encontrado.
							alert("CEP não encontrado.");
						}
					});
		}
	</script>
</body>
</html>