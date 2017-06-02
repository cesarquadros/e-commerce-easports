<jsp:include page="cabecalho2.jsp"></jsp:include>
<link rel="stylesheet" href="./css/stepbar.css" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="container-fuid">
	<br />	
	<div class="stepwizard">
		<div class="stepwizard-row">
			<div class="stepwizard-step">
				<a href="/e-commerce-easports/CarrinhoServlet?acao=carrinhobycli" class="btn btn-default btn-circle" disabled="disabled" >
					<span class="glyphicon glyphicon-shopping-cart" id="iconeCarrinho"></span>
				</a>
				<p>Carrinho</p>
			</div>

			<div class="stepwizard-step">
				<a href="/e-commerce-easports/ComprarProdutoServlet?acao=finalizarbyid" class="btn btn-default btn-circle" disabled="disabled">
					<span class="glyphicon glyphicon-usd"></span>
				</a>
				<p>Pagamento</p>
			</div>
			
			<div class="stepwizard-step">
				<button type="button" class="btn btn-success btn-circle" >
					<span class="glyphicon glyphicon-ok"></span>
				</button>
				<p>Confirmação</p>
			</div>
		</div>
	</div>
</div>
<br />
<div class="container">
	<div class="row">
		<div class="col-xs-12 col-sm-12 col-md-6">
			<h3>Obrigado por comprar na easports.com.br</h3>
			<h4>Protocolo: ${sessionScope.protocolo}</h4>
			<c:remove scope="session" var="protocolo" />
		</div>
		
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-12">
			<table class="table table-hover">
					<thead>
						<tr style="background: #eee;">
							<th>Itens</th>
							<th>Quantidade</th>
							<th>Valor</th>
						</tr>
					</thead>
					<c:forEach items="${sessionScope.carrinhocount}" var="carrinho">
						<tbody style="font-size: 12px;">
							<tr>
								<td>${carrinho.produto.nome}</td>
								<td>${carrinho.quantidade}</td>
								<td>${carrinho.valorFormatado}</td>
							</tr>
						</tbody>
					</c:forEach>
					<tbody>
						<tr style="background: #eee;">
							<td>Total a pagar:</td>
							<td></td>
							<td>${sessionScope.valorTotalFormatado}</td>
						</tr>
					</tbody>
				</table>
				 <c:remove scope="session" var="carrinhocount" />
				 <c:remove scope="session" var="valorTotalFormatado" />
			</div>
		</div>		
	</div>
	
	<div class="row">
		<div class="col-xs-12 col-sm-12 col-md-12">
			<a  href="index.jsp">Home</a>
		</div>		
	</div>
</div>