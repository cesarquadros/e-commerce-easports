
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="cabecalho2.jsp"></jsp:include>
<link rel="stylesheet" href="./css/stepbar.css" />

<div class="container" ng-app="app" ng-controller="appCtrl">
	<br />
	
	
	
		<div class="stepwizard">
		<div class="stepwizard-row">
			<div class="stepwizard-step">
				<a href="/e-commerce-easports/CarrinhoServlet?acao=carrinhobycli" class="btn btn-primary btn-circle">
					<span class="glyphicon glyphicon-shopping-cart" id="iconeCarrinho"></span>
				</a>
				<p>Carrinho</p>
			</div>

			<div class="stepwizard-step">
				<a href="/e-commerce-easports/ComprarProdutoServlet?acao=finalizarbyid" class="btn btn-default btn-circle">
					<span class="glyphicon glyphicon-send"></span>
				</a>
				<p>Pagamento</p>
			</div>
			
			<div class="stepwizard-step">
				<button type="button" class="btn btn-default btn-circle" disabled="disabled">
					<span class="glyphicon glyphicon-ok"></span>
				</button>
				<p>Finalizar venda</p>
			</div>
		</div>
	</div>
	
	
	
	
	
	<br /> <br />
	<div class="row">

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

		<div class="col-xs-12 col-sm-12 col-md-12">
			<table class="table table-hover">
				<thead>
					<tr>
						<th>Produto</th>
						<th>Quant.</th>
						<th>Valor Unitário</th>
						<th>Valor Total</th>

					</tr>
				</thead>
				<c:forEach items="${carrinho}" var="carrinho">
					<tbody>
						<tr>
							<td>${carrinho.produto.nome}</td>
							<td>*</td>
							<td>R$ ${carrinho.produto.valorVendaFormatado}</td>
							<td>R$</td>
							<td><a class="btn btn-danger navbar-btn"
								ng-click="excluirItem(${carrinho.idItem},'excluiritem')">Excluir</a></td>
						</tr>
					</tbody>
				</c:forEach>
			</table>
		</div>

		<div class="col-xs-12 col-sm-12 col-md-6">
			<a href="./index.jsp" class="btn btn-default navbar-btn">Escolher
				+ Produtos</a>
		</div>
		<div class="col-xs-12 col-sm-12 col-md-6">
			<a href="finalizarcompra.jsp" class="btn btn-default navbar-btn">Finalizar
				Compra</a>
		</div>
	</div>
</div>
<jsp:include page="rodape.jsp"></jsp:include>
