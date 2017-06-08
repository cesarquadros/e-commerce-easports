<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fnc"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="cabecalho3.jsp"></jsp:include>
<link rel="stylesheet" href="./css/stepbar.css" />
<script src="./js/increment.js"></script>
<link rel="stylesheet" href="./css/increment.css" />
<div class="container" ng-app="app" ng-controller="appCtrl">
	<br />
	<div class="stepwizard" ng-if="${fnc:length(cliente.listaItens)} > 0">
		<div class="stepwizard-row">
			<div class="stepwizard-step">
				<a href="/e-commerce-easports/CarrinhoServlet?acao=carrinhobycli"
					class="btn btn-primary btn-circle"> <span
					class="glyphicon glyphicon-shopping-cart" id="iconeCarrinho"></span>
				</a>
				<p>Carrinho</p>
			</div>

			<div class="stepwizard-step">
				<a
					href="/e-commerce-easports/ComprarProdutoServlet?acao=finalizarbyid"
					class="btn btn-default btn-circle"> <span
					class="glyphicon glyphicon-usd"></span>
				</a>
				<p>Pagamento</p>
			</div>

			<div class="stepwizard-step">
				<button type="button" class="btn btn-default btn-circle"
					disabled="disabled">
					<span class="glyphicon glyphicon-ok"></span>
				</button>
				<p>Confirmação</p>
			</div>
		</div>
	</div>

	<br /> <br />
	<div class="row" ng-if="${fnc:length(cliente.listaItens)} > 0">

		<div class="col-xs-12 col-sm-12 col-md-6">
			<a href="./index.jsp" class="btn btn-default navbar-btn">Escolher
				+ Produtos</a>
		</div>
		<div class="col-xs-12 col-sm-12 col-md-6">
			<a
				href="/e-commerce-easports/ComprarProdutoServlet?acao=finalizarbyid"
				class="btn btn-default navbar-btn">Finalizar Compra</a>
		</div>

		<br /> <br /> <br /> <br />

		<div class="table-responsive">
			<div class="col-xs-12 col-sm-12 col-md-12">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>Produto</th>
							<th>Quant.</th>
							<th>Valor Unitário</th>
							<th>Valor Total</th>
							<th>Estoque</th>
						</tr>
					</thead>
					<c:forEach items="${carrinhocount}" var="carrinho">
						<tbody>
							<tr>
								<td>${carrinho.produto.nome}</td>
								<td>${carrinho.quantidade}</td>
								<td>${carrinho.produto.valorVendaFormatado}</td>
								<td>${carrinho.valorFormatado}</td>
								<td>${carrinho.produto.quantidade}</td>
								<td><a class="btn btn-danger navbar-btn"
									ng-click="excluirItem(${carrinho.produto.idProduto},'excluiritem')"><span
										class="glyphicon glyphicon-minus-sign"></span></a></td>
								<td><a href="#" class="btn btn-success navbar-btn"
									ng-click="addCarrinho(${carrinho.produto.idProduto},'adicionar', ${carrinho.quantidade}, ${carrinho.produto.quantidade})">
										<span class="glyphicon glyphicon-plus-sign"></span>
								</a></td>

							</tr>
						</tbody>
					</c:forEach>
				</table>
			</div>
		</div>
		<div class="col-xs-12 col-sm-12 col-md-6">
			<a href="./index.jsp" class="btn btn-default navbar-btn">Escolher
				+ Produtos</a>
		</div>
		<div class="col-xs-12 col-sm-12 col-md-6">
			<a ng-if="${fnc:length(usuarioLogado.listaItens)} > 0"
				href="/e-commerce-easports/ComprarProdutoServlet?acao=finalizarbyid"
				class="btn btn-default navbar-btn">Finalizar Compra</a>
		</div>
	</div>
	<div class="row" ng-if="${fnc:length(cliente.listaItens)} < 1">
		<h1>Seu Carrinho esta vazio</h1>
		<a href="index.jsp">Voltar para home</a>
	</div>
</div>
<jsp:include page="rodape.jsp"></jsp:include>
