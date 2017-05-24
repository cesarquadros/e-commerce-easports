
<jsp:include page="cabecalho3.jsp"></jsp:include>
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
					<h4>Olá ${cliente.nome}</h4>
				</div>
			</div>
			<div class="row">
				<div class="col-xs-12 col-sm-12 col-md-12">
					<p>${cliente.email}</p>
				</div>
			</div>
		</div>

		<div class="col-xs-12 col-sm-12 col-md-9">
			<div class="row">
				<div class="col-xs-12 col-sm-12 col-md-12">
					<h4>MEUS PEDIDOS</h4>
					<hr />
					<ul>
						<li><a href="#">Relatorio de compras</a></li>
					</ul>

					<br />
				</div>
			</div>
			<div class="row">
				<div class="col-xs-12 col-sm-12 col-md-12">
					<h4>MEUS DADOS</h4>
					<hr />
					<ul>
						<li><a href="#" id="btnDadosPessoais">Dados pessoais ${mensagem}</a></li>
						<li><a href="#" id="btnEnd">Endereço</a></li>
						<li><a href="#">Alterar senha</a></li>
					</ul>
					<br />
				</div>
			</div>
			<div class="row">
				<div class="col-xs-12 col-sm-12 col-md-12">
					<h4>Pagamento</h4>
					<hr />
					<ul>
						<li ng-if="${cliente.cartao.numeroX}"><a href="#" id="btnCard">Editar Cartão</a> - ${cliente.cartao.numeroX}</li>
						<li ng-if="'${cliente.cartao.numeroX}' == ''"><a href="#" id="btnCardInsert">Inserir Cartão</a></li>
					</ul>
					<br />
				</div>
			</div>
		</div>
	</div>

	<!-- -------------------------------------------------------------------------- MODAL ENDEREÇO ------------------------------------------------------->
	<div id="modalEndereco" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h2 class="modal-title center">Alterar endereço</h2>
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
					<h2 class="modal-title center">Alterar Cartão</h2>
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
				<h2 class="modal-title center">Cadastro Cartão</h2>
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
				<h2 class="modal-title center">Cadastro Cartão</h2>
			</div>
			<div class="modal-body">
				<div class="jumbotron">
					<form name="formulario" method="post"
						action="/e-commerce-easports/ClienteServlet?acao=update&page=minhaconta">
						<jsp:include page="formcliente.jsp"></jsp:include>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
</div>
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