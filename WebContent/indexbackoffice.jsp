<jsp:include page="cabecalhobackoffice.jsp"></jsp:include>
<jsp:include page="menubackoffice.jsp"></jsp:include>
<script src="./controller/controllerProduto.js"></script>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="container" ng-app="app" ng-controller="appCtrl" ng-init="listAll()">
	<div class="row">
		<h1 class="center">Produtos</h1>
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
				<h5>Quantidade: {{produto.quantidade}}</h5>
				<a
					href="/e-commerce-easports/ProdutoServlet?acao=paginaeditar&id={{produto.idProduto}}"
					class="btn btn-default navbar-btn center" > <span
					class="glyphicon glyphicon-pencil"></span> Editar
				</a>
			</div>
		</div>
	</div>
</div>

<div id="myModal" class="modal fade" role="dialog">
	<div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content center">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">${sessionScope.titulo}</h4>
			</div>
			<div class="modal-body">
				<h4>${sessionScope.mensagem}</h4>
				<h5>${sessionScope.erro }</h5>
				<!-- <h5><img src="/img/${imagem}.jpg" class="img-responsive"></h5>-->

			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default center"
					data-dismiss="modal">Fechar</button>
			</div>
		</div>
	</div>
</div>
<c:if test="${modal=='1'}">
	<script>
		$(document).ready(function() {
			$('#myModal').modal('show');
		});
	</script>
</c:if>
<c:remove scope="session" var="mensagem" />
<c:remove scope="session" var="modal" />
<c:remove scope="session" var="titulo" />
<c:remove scope="session" var="erro" />
