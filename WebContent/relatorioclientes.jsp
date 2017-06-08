<jsp:include page="cabecalhobackoffice.jsp"></jsp:include>
<jsp:include page="menubackoffice.jsp"></jsp:include>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fnc"%>
<script src="./controller/controllerProduto.js"></script>

<div class="container" ng-app="app" ng-controller="appCtrl"
	ng-init="listAllClientes()">
	<div class="row">
		<h1 class="center">Produtos</h1>
		<div class="col-xs-12 col-sm-12 col-md-6" id="buscarDoBanner">
			<input class="form-control input-lg" type="text" placeholder="Buscar"
				id="pesquisacli" ng-model="pesquisacli">
		</div>
	</div>
	<br />
	<div class="row">
	<table class="table table-hover">
		<thead>
			<tr style="background: #eee;">
				<th>ID</th>
				<th>Nome</th>
				<th>Email</th>
				<th>Telefone</th>
				<th>CPF</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<tr ng-repeat="clientes in array | filter:pesquisacli">
				<td>{{clientes.idCliente}}</td>
				<td>{{clientes.nome}}</td>
				<td>{{clientes.email}}</td>
				<td>{{clientes.telefone}}</td>
				<td>{{clientes.cpf}}</td>
				<td><a type="button" class="btn btn-default navbar-btn"
					href="/e-commerce-easports/ClienteServlet?acao=updatesenhabackoffice&cpf={{clientes.cpf}}"
					id="btnResetSenha">Resetar senha</a></td>
			</tr>
		</tbody>
	</table>
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

<c:if test="${modal=='1'}">
	<script>
		$(document).ready(function() {
			$('#modalMsg').modal('show');
		});
	</script>
</c:if>
</script>
<c:remove scope="session" var="modal" />
<c:remove scope="session" var="mensagem" />