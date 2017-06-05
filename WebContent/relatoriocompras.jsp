<jsp:include page="cabecalho2.jsp"></jsp:include>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fnc"%>
<div class="container">
	<div class="row">
		<div class="col-xs-12 col-sm-12 col-md-12">
			<h1>Vendas Realizadas</h1>
			<br /> <br /> <br />

			<form name="formulario" method="post" action="/e-commerce-easports/RelatorioServlet?acao=relatorioperiodo">
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
						<button type="submit" class="btn btn-primary">Gerar Relatório</button>
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
							<td>${fnc:length(listavenda.listaItens)}</td>
						</tr>
					</tbody>
				</c:forEach>
				<c:remove scope="session" var="listacompras" />
			</table>
		</div>
	</div>
</div>