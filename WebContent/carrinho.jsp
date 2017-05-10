	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<jsp:include page="cabecalho1.jsp"></jsp:include>
		
        <div class="container">
            <div class="row">

                <div class="col-xs-12 col-sm-12 col-md-6">              
                    <a href="./index.jsp" class="btn btn-default navbar-btn">Escolher + Produtos</a>
                </div>
                <div class="col-xs-12 col-sm-12 col-md-6">              
                    <a href="/e-commerce-easports/ComprarProdutoServlet?acao=finalizarbyid" class="btn btn-default navbar-btn">Finalizar Compra</a>
                </div>
                
				<br />	
				<br />	
				<br />
				<br />
				
                <div class="col-xs-12 col-sm-12 col-md-12">
                    <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th>Produto</th>
                                    <th>Quant.</th>
                                    <th>Valor Unitário</th>
                                    <th>Valor Total</th>
                                                                 
                                </tr>
                            </thead>
                            <c:forEach items="${carrinho}" var="carrinho">
                            <tbody>
                                <tr>
                                    <td>${carrinho.produto.nome}</td>
                                    <td>*</td>
                                    <td>R$ ${carrinho.produto.valorVendaFormatado}</td>
                                    <td>R$</td>
                                    <td><a class="btn btn-danger navbar-btn" ng-click="excluirItem(${carrinho.idItem},'excluiritem')">Excluir</a></td>                              
                                </tr>
                            </tbody>
                            </c:forEach>
                        </table>
                </div>

                <div class="col-xs-12 col-sm-12 col-md-6">              
                    <a href="./index.jsp" class="btn btn-default navbar-btn">Escolher + Produtos</a>
                </div>
                <div class="col-xs-12 col-sm-12 col-md-6">              
                    <a href="finalizarcompra.jsp" class="btn btn-default navbar-btn">Finalizar Compra</a>
                </div>
            </div>
        </div>
              	<jsp:include page="rodape.jsp"></jsp:include>
