<jsp:include page="cabecalho2.jsp"></jsp:include>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="container">
	<div class="row">
		<div class="col-xs-12 col-sm-12 col-md-12">
		<h3>Vendas Realizadas</h3>
		<table class="table table-hover">
			<thead>
				<tr style="background: #eee;">
					<th>Codigo venda</th>
					<th>Forma de Pagamento</th>
					<th>Parcelas</th>
					<th>Data/Hora</th>
					<th>Produtos</th>
				</tr>
			</thead>
			<c:forEach items="${listacompras}" var="listavenda">
				<tbody>
					<tr>
						<td>${listavenda.idCompra}</td>
						<td>${listavenda.tipoPagamento}</td>
						<th>${listavenda.parcelas}</th>
						<td>${listavenda.dataCompraFormata}</td>
						<td><a href="#">Exibir produtos</a></td>
					</tr>
				</tbody>
			</c:forEach>
		</table>	
		</div>	
	</div>
</div>