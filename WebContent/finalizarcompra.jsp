<jsp:include page="cabecalho2.jsp"></jsp:include>
<link rel="stylesheet" href="./css/stepbar.css" />
<link rel="stylesheet" href="./css/radio.css" />
<script src=https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.6.1/angular.min.js></script>
<div class="container" ng-app="app" ng-controller="appCtrl">

	<br />
	<div class="stepwizard">
		<div class="stepwizard-row">
			<div class="stepwizard-step">
				<a href="/e-commerce-easports/CarrinhoServlet?acao=carrinhobycli"
					class="btn btn-default btn-circle"> <span
					class="glyphicon glyphicon-shopping-cart" id="iconeCarrinho"></span>
				</a>
				<p>Carrinho</p>
			</div>

			<div class="stepwizard-step">
				<a
					href="/e-commerce-easports/ComprarProdutoServlet?acao=finalizarbyid"
					class="btn btn-primary btn-circle"> <span
					class="glyphicon glyphicon-send"></span>
				</a>
				<p>Pagamento</p>
			</div>

			<div class="stepwizard-step">
				<button type="button" class="btn btn-default btn-circle"
					disabled="disabled">
					<span class="glyphicon glyphicon-ok"></span>
				</button>
				<p>Finalizar venda</p>
			</div>
		</div>
	</div>
	<br /> <br />
	
	
	
	<div class="row">
	
			<div class="col-xs-12 col-sm-12 col-md-6">
			<div class="jumbotron">
				<div class="center">
					<h3>Cartão de Crédito</h3>
					<div class="glyphicon glyphicon-credit-card center"
						id="iconeCartao"></div>
				</div>

				<div class="funkyradio">
			        <div class="funkyradio-success">
			            <input type="radio" name="radio" id="radio3" checked/>
			            <label for="radio3">${cliente.nome}</label>
			        </div>
					<div class="funkyradio-primary">
						<input type="checkbox" name="radio" id="radio2" ng-model="outrocartao" ng-init="outrocartao=false"/> 
						<label for="radio2">Outro cartão</label>
					</div>
				</div> 
				
				<form action="" ng-if="outrocartao">
					<div class="form-group">
						<label for="inputNumCartao">Número</label> <input type="email"
							class="form-control" id="inputNumCartao" placeholder="Número">
					</div>
					<div class="form-group">
						<label for="inputNomeCartao">Nome Impresso</label> <input
							type="email" class="form-control" id="inputNomeCartao"
							placeholder="Nome">
					</div>
					<div class="form-group">
						<label for="inputValidCartao">Validade</label> <input type="email"
							class="form-control" id="inputValidCartao" placeholder="Data">
					</div>
					<div class="form-group">
						<label for="inputCodSegCart">Código de Segurança</label> <input
							type="email" class="form-control" id="inputCodSegCart"
							placeholder="Código">
					</div>
					<div class="form-group">
						<label for="inputParcelas">Parcelar em:</label> <input
							type="number" class="form-control" id="inputParcelas"
							placeholder="0">
					</div>

					<div class="center">
						<button type="button" class="btn btn-default navbar-btn">Finalizar
							Compra</button>
					</div>
				</form>
			</div>
		</div>

	

		<div class="col-xs-12 col-sm-12 col-md-6 center">
			<div class="jumbotron">
				<h4>Endereço de Entrega</h4>
				<div class="glyphicon glyphicon-send" id="iconeEnvio"></div>
				<address>
					<strong>${cliente.nome}</strong><br>
					${cliente.endereco.logradouro}, ${cliente.endereco.numero}
					(${cliente.endereco.complemento})- ${cliente.endereco.bairro}<br>
					${cliente.endereco.cidade} - ${cliente.endereco.estado},
					${cliente.endereco.cep}<br>
				</address>
				<button type="button" class="btn btn-default navbar-btn">Aterar
					Endereço</button>
			</div>
		</div>
		

	</div>
</div>

<jsp:include page="rodape.jsp"></jsp:include>