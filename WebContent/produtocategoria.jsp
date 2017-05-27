<jsp:include page="cabecalho1.jsp"></jsp:include>

<!-- TagLibraries (JSTL) -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fnc"%>


	<div class="container center">            
		<div class="row">
			<c:forEach items="${listaProdutos}" var="produto">
				<div class="col-xs-12 col-sm-6 col-md-3">
					<div class="thumbnail">
						<img src="img/${produto.imagem}" class="img-responsive" style="max-width: 50%;">
						<h5 class="center">${produto.nome}</h5>
						<h6>${produto.valorVendaFormatado}</h6>
						<a href="#" class="btn btn-success navbar-btn" ng-click="addCarrinho(${produto.idProduto},'adicionar')">
						<span class="glyphicon glyphicon-shopping-cart"></span> Adicionar
						
						</a>
						<a href="/e-commerce-easports/ProdutoServlet?acao=findById&id=${produto.idProduto}" 
							class="btn btn-default navbar-btn">
						<span class="glyphicon glyphicon-plus-sign"></span> Detalhes
						
						</a>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	
<jsp:include page="rodape.jsp"></jsp:include>