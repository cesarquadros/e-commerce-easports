<jsp:include page="cabecalhobackoffice.jsp"></jsp:include>
<jsp:include page="menubackoffice.jsp"></jsp:include>
<script src="./controller/controllerProduto.js"></script>

<div class="container" ng-app="app" ng-controller="appCtrl" ng-init="listAll()">
	<div class="row">
		<h1 class="center">Relatório de Produtos</h1>
		<div class="col-xs-12 col-sm-12 col-md-6" id="buscarDoBanner">
			<input class="form-control input-lg" type="text" placeholder="Buscar"
				id="pesquisaprod" ng-model="pesquisaprod">
		</div>
	</div>
	<br />
	<div class="row">
		<div class="col-xs-12 col-sm-6 col-md-4"
			ng-repeat="produto in array | filter:pesquisaprod">
			<div class="thumbnail">
				<img src="img/{{produto.imagem}}" class="img-responsive"
					style="max-width: 50%;">
				<hr>
				<h5>{{produto.nome}}</h5>
				<a
					href="/e-commerce-easports/ProdutoServlet?acao=paginaeditar&id={{produto.idProduto}}"
					class="btn btn-default navbar-btn center" > <span
					class="glyphicon glyphicon-pencil"></span> Editar
				</a>
			</div>
		</div>
	</div>
</div>
