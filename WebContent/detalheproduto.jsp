<link rel="stylesheet" type="text/css" href="./css/imageZoom.css" />
<jsp:include page="cabecalho1.jsp"></jsp:include>

<div class="container">
	<div class="row">
		<div class="col-xs-12 col-sm-12 col-md-6">
			<img
				src="img/${produto.imagem}"
				class="img-responsive" style="max-width: 70%;"/>
		</div>

		<div class="col-xs-12 col-sm-12 col-md-6">
			<div class="jumbotron">
				<h3>${produto.nome}</h3>
				<h6>${produto.codigo}</h6>
				<hr />
				<div>
					<h3>${produto.valorVendaFormatado}</h3>
					<h5>Em até 10x sem juros</h5>
					<h6>ver mais opções de parcelas</h6>
					<a href="#" class="btn btn-success navbar-btn" ng-click="addCarrinho(${produto.idProduto},'adicionar')">
						<span class="glyphicon glyphicon-shopping-cart"></span> Adicionar
						
					</a>
				</div>
			</div>
		</div>
	</div>
</div>
<br />


<div class="container">

	<div class="row">
		<div class=" jumbotron col-xs-12 col-sm-12 col-md-12 col-lg-12">
			<h3>DESCRIÇÃO</h3>			
			<h5>${produto.descricao}</h5>
			<hr />
			<br />

			<div id="listadescricao">
				<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
					<ul>
						<li><strong> Nome: </strong> ${produto.nome}</li>
						<li><strong> Categoria: </strong> ${produto.categoria.nome}</li>
						<li><strong> Origem: </strong>${produto.origem}</li>
					</ul>
				</div>

				<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
					<ul>
						<li><strong> Peso do Produto: </strong>${produto.peso}</li>
						<li><strong> Dimensões Aproximadas: </strong> ${produto.dimensoes}</li>
						<li><strong> Garantia do Fabricante:  </strong>${produto.garantia}</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>


<jsp:include page="rodape.jsp"></jsp:include>