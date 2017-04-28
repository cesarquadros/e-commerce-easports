	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<jsp:useBean class="br.com.ecommerceeasports.managedbean.ManagedBeanProduto" id="mb"></jsp:useBean>
	<jsp:include page="cabecalho1.jsp"></jsp:include>

	<div class="container" id="carrossel">
		<div id="carousel-example-generic" class="carousel slide"
			data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#carousel-example-generic" data-slide-to="0"
					class="active"></li>
				<li data-target="#carousel-example-generic" data-slide-to="1"></li>
				<li data-target="#carousel-example-generic" data-slide-to="2"></li>
			</ol>

			<!-- Wrapper for slides -->
			<div class="carousel-inner" role="listbox">
				<div class="item active">
					<img
						src="http://www.progressivesurfacademy.com/wp-content/uploads/private-surf-coaching/performancesurfing2_2000x600.jpg"
						alt="...">
					<div class="carousel-caption"></div>
				</div>
				<div class="item">
					<img
						src="http://www.clubdeocionudos.com/wp-content/uploads/2015/01/Fondo-tenis2.jpg"
						alt="...">
					<div class="carousel-caption"></div>
				</div>

				<div class="item">
					<img
						src="https://i0.wp.com/www.altmannsports.ch/925/wp-content/uploads/2016/12/MDaviet_TIGN_151113_280.jpg?resize=2000%2C600"
						alt="...">
					<div class="carousel-caption"></div>
				</div>
			</div>

			<!-- Controls -->
			<a class="left carousel-control" href="#carousel-example-generic"
				role="button" data-slide="prev"> <span
				class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#carousel-example-generic"
				role="button" data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
		</div>
	</div>

	<div class="container center">
		<div class="row">
		
		<c:forEach items="${mb.listagemProdutos}" var="produto">
			<div class="col-xs-12 col-sm-6 col-md-3">
				<div class="thumbnail">
					<img 
						src="img/${produto.imagem}"
						class="img-responsive">	
						<hr>				
						<h5 class="center">${ produto.nome}</h5>
						<h6>${produto.valorVendaFormatado}</h6>
					<a href="detalheproduto.jsp" class="btn btn-success navbar-btn">
					 <span class="glyphicon glyphicon-shopping-cart"></span>
						Adicionar ao carrinho
					</a>
					</div>
			</div>
			</c:forEach>

		</div>
	</div>	

	<jsp:include page="rodape.jsp"></jsp:include>

