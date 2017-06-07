
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fnc"%>

<jsp:include page="cabecalho3.jsp"></jsp:include>
<jsp:include page="menu.jsp"></jsp:include>

<div class="container">
	<div class="row">
		<div class="col-xs-12 col-sm-12 col-md-12">
			<h1 class="center">Relatório de Vendas</h1>
			<br /> <br /> <br />

			<form name="formulario" method="post"
				action="/e-commerce-easports/RelatorioServlet?acao=relatorioperiodobycliente">
				<div class="row">
					<div class="col-xs-12 col-sm-3 col-md-3">
						<div class="form-group">
							<label for="inputInicio">Data inicio</label> <input type="date"
								class="form-control" id="inputDtNasc" placeholder="dd/mm/aaaa"
								name="datainicio" required>
						</div>
					</div>
					<div class="col-xs-12 col-sm-3 col-md-3">
						<div class="form-group">
							<label for="inputFim">Data final</label> <input type="date"
								class="form-control" id="inputDtNasc" placeholder="dd/mm/aaaa"
								name="datafim" required>
						</div>
					</div>
					<div class="col-xs-12 col-sm-3 col-md-3">
						<button type="submit" class="btn btn-primary">Gerar
							Relatório</button>
					</div>
				</div>
			</form>

			<table class="table table-hover">
				<thead>
					<tr style="background: #eee;">
						<th>Codigo venda</th>
						<th>Pagamento</th>
						<th>Parcelas</th>
						<th>Valor</th>
						<th>Data/Hora</th>
						<th>Produtos</th>
					</tr>
				</thead>
				<c:forEach items="${sessionScope.listacompras}" var="listavenda">
					<tbody>
						<tr>
							<td>${listavenda.numProtocolo}</td>
							<td>${listavenda.tipoPagamento}</td>
							<th>${listavenda.parcelas}</th>
							<th>${listavenda.valorTotalFormatado}</th>
							<td>${listavenda.dataCompraFormata}</td>
							<td>
								<button type="button" class="btn btn-default navbar-btn"
									id="${listavenda.numProtocolo}">${fnc:length(listavenda.listaItens)}
									Produtos</button>
							</td>
						</tr>
					</tbody>
					<div id="${listavenda.idCompra}" class="modal fade" role="dialog">
						<div class="modal-dialog">
							<!-- Modal content-->
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal">&times;</button>
									<h3 class="modal-title center">Lista de Itens</h3>
									<h5 class="modal-title center">Protocolo: ${listavenda.numProtocolo}</h5>
								</div>
								<div class="modal-body">
										<c:forEach items="${listavenda.listaItens}" var="listaproduto">
										<p class="center">${listaproduto.produto.nome} - <strong>${listaproduto.produto.valorVendaFormatado}</strong></p>
									</c:forEach>
								</div>
							</div>
						</div>
					</div>

					<script>
						$(document).ready(function() {
							$("#${listavenda.numProtocolo}").click(function() {
								$("#${listavenda.idCompra}").modal();
							});
						});
					</script>

				</c:forEach>
				<c:remove scope="session" var="listacompras" />
			</table>
		</div>
	</div>
</div>