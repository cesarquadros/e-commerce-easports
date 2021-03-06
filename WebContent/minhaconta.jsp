
<jsp:include page="cabecalho3.jsp"></jsp:include>
<jsp:include page="menu.jsp"></jsp:include>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<br />
<br />
<br />
<div class="container" ng-app="app" ng-controller="appCtrl">

	<div class="row">
		<div class="col-xs-12 col-sm-12 col-md-2"
			style="background: #eee; padding-top: 20px;">
			<div class="row">
				<div class="col-xs-12 col-sm-12 col-md-12">
					<img alt="avatar" src="./imagens_projeto/avatar.jpg">
				</div>
			</div>
			<div class="row">
				<div class="col-xs-12 col-sm-12 col-md-12">
					<h4>Ol� ${usuarioLogado.nome}</h4>
				</div>
			</div>
		</div>

		<div class="col-xs-12 col-sm-12 col-md-9">
			<div class="row">
				<div class="col-xs-12 col-sm-12 col-md-12">
					<h4>MEUS PEDIDOS</h4>
					<hr />
					<ul>
						<li><a href="./relatoriocompracliente.jsp">Relatorio de
								compras</a></li>
					</ul>
					<br />
				</div>
			</div>
			<div class="row">
				<div class="col-xs-12 col-sm-12 col-md-12">
					<h4>MEUS DADOS</h4>
					<hr />
					<ul>
						<li><a href="#" id="btnDadosPessoais">Dados pessoais </a></li>
						<li><a href="#" id="btnEnd">Endere�o</a> - 
							${sessionScope.cliente.endereco.logradouro}, ${sessionScope.cliente.endereco.numero} 
							${sessionScope.cliente.endereco.complemento} - ${sessionScope.cliente.endereco.bairro} - 
							${sessionScope.cliente.endereco.cep} - ${sessionScope.cliente.endereco.cidade}-${sessionScope.cliente.endereco.estado}
						</li>
						<li><a href="#" id="btnEditarSenha">Alterar senha</a></li>
					</ul>
					<br />
				</div>
			</div>
			<div class="row">
				<div class="col-xs-12 col-sm-12 col-md-12">
					<h4>Pagamento</h4>
					<hr />
					<ul>
						<li ng-if="${usuarioLogado.cartao.numeroX}"><a href="#"
							id="btnCard">Editar Cart�o</a> - ${usuarioLogado.cartao.numeroX}</li>
						<li ng-if="'${usuarioLogado.cartao.numeroX}' == ''"><a
							href="#" id="btnCardInsert">Inserir Cart�o</a></li>
					</ul>
					<br />
				</div>
			</div>
		</div>
	</div>

	<!-- -------------------------------------------------------------------------- MODAL ENDERE�O ------------------------------------------------------->
	<div id="modalEndereco" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h2 class="modal-title center">Alterar endere�o</h2>
				</div>
				<div class="jumbotron">
					<form name="formulario" method="post"
						action="/e-commerce-easports/ClienteServlet?acao=updateendereco&page=minhaconta">
						<jsp:include page="formendereco.jsp"></jsp:include>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- ------------------------------------------------------------------------------  MODAL EDITAR CARTAO ------------------------------------------------------->

	<div id="modalAlterarCartao" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h2 class="modal-title center">Alterar Cart�o</h2>
				</div>
				<div class="modal-body">
					<div class="jumbotron">
						<form name="formulario" method="post"
							action="/e-commerce-easports/CartaoServlet?acao=update&page=minhaconta">
							<jsp:include page="formcartaoupdate.jsp"></jsp:include>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- ------------------------------------------------------------------------------  MODAL INSERIR CARTAO ------------------------------------------------------->
	<div id="modalCadastroCartao" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h2 class="modal-title center">Cadastro Cart�o</h2>
				</div>
				<div class="modal-body">
					<div class="jumbotron">
						<form name="formulario" method="post"
							action="/e-commerce-easports/CartaoServlet?acao=insert&page=minhaconta">
							<jsp:include page="formcartaoinsert.jsp"></jsp:include>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- ------------------------------------------------------------------------------  MODAL ALTERAR DADOS PESSOAIS ------------------------------------------------------->
	<div id="modalDadosPessoais" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h2 class="modal-title center">Cadastro Cart�o</h2>
				</div>
				<div class="modal-body">
					<div class="jumbotron">
						<form name="formulario" method="post"
							action="/e-commerce-easports/ClienteServlet?acao=update&page=minhaconta">
							<jsp:include page="formeditarcliente.jsp"></jsp:include>
							<div class="center">
								<button type="submit" class="btn btn-success">Salvar
									edi��o</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- ------------------------------------------------------------------------------  MODAL MENSAGEM ------------------------------------------------------->
<div id="modalMsg" class="modal fade" role="dialog">
	<div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content center">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">${titulo}</h4>
			</div>
			<div class="modal-body">
				<h2>${mensagem}</h2>
				<h3>${retorno}</h3>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
			</div>
		</div>
	</div>
</div>

<!-- ------------------------------------------------------------------------------  MODAL EDITAR SENHA ------------------------------------------------------->
<div id="modalEditarSenha" class="modal fade" role="dialog">
	<div class="modal-dialog">
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h2 class="modal-title center">Alterar Senha</h2>
			</div>
			<div class="modal-body">
				<div class="jumbotron">
					<form name="formulario" method="post"
						action="/e-commerce-easports/ClienteServlet?acao=updatesenha&page=minhaconta">


						<div class="form-group">
							<label for="inputSenha">Nova Senha</label> <input type="password"
								class="form-control" id="inputSenha" placeholder="Senha"
								name="senha" required ng-model="senha">
						</div>
						<div class="form-group">
							<label for="inputSenhaC">Confirmar Senha</label> <input
								type="password" class="form-control" id="inputSenhaC"
								placeholder="Senha" name="confirmarsenha"
								ng-model="corfirmSenha" ng-blur="validarSenha()" required>
							<h6 ng-if="result" style="color: red;" class="center">Senhas n�o conferem.</h6>
						</div>

						<div class="center">
							<button type="submit" class="btn btn-success">Salvar nova senha</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>


<c:if test="${modal=='1'}">
	<script>
		$(document).ready(function() {
			$('#modalMsg').modal('show');
		});
	</script>
</c:if>

<script>
	$(document).ready(function() {
		$("#btnEditarSenha").click(function() {
			$("#modalEditarSenha").modal();
		});
	});
</script>

<script>
	$(document).ready(function() {
		$("#btnEnd").click(function() {
			$("#modalEndereco").modal();
		});
	});
</script>

<script>
	$(document).ready(function() {
		$("#btnCard").click(function() {
			$("#modalAlterarCartao").modal();
		});
	});
</script>
<script>
	$(document).ready(function() {
		$("#btnCardInsert").click(function() {
			$("#modalCadastroCartao").modal();
		});
	});
</script>
<script>
	$(document).ready(function() {
		$("#btnDadosPessoais").click(function() {
			$("#modalDadosPessoais").modal();
		});
	});
</script>
<c:remove scope="session" var="modal" />
<c:remove scope="session" var="mensagem" />