<jsp:include page="cabecalho2.jsp"></jsp:include>
<link rel="stylesheet" href="./css/stepbar.css" />

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
		</div>		
	</div>
	
	<div class="row">
		<div class="col-xs-12 col-sm-12 col-md-12">
			<a  href="/e-commerce-easports/ComprarProdutoServlet?acao=listacompra">Vendas</a>
		</div>		
	</div>
</div>