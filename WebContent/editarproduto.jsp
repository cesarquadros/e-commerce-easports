<script src="./js/jquery.js" type="text/javascript"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.11/jquery.mask.js"
	type="text/javascript"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.11/jquery.mask.min.js"
	type="text/javascript"></script>
<script src="./js/mask.js"></script>
<jsp:include page="cabecalhobackoffice.jsp"></jsp:include>
<jsp:include page="menubackoffice.jsp"></jsp:include>
<jsp:useBean
	class="br.com.ecommerceeasports.managedbean.ManagedBeanCategoria"
	id="mbCategoria"></jsp:useBean>

<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script src="masks.js" type="text/javascript"></script>

<div class="container">
	<div class="row">

		<div class="col-xs-12 col-sm-12 col-md-4">
			<img src="img/${sessionScope.produto.imagem}" class="img-responsive"
				style="max-width: 70%;" />

			<form name="formulario" method="post" enctype="multipart/form-data"
				action="/e-commerce-easports/ProdutoServlet?idProduto=${sessionScope.produto.idProduto}">
				
				<input type="hidden" name="acao" value="editarimagem">
				<div class="form-group">
					<label for="exampleInputFile">Alterar imagem</label> <input
						type="file" id="inputFotoProd" name="img" required>
				</div>
				<button type="submit" class="btn btn-default">Alterar</button>
			</form>
		</div>

		<div class="col-xs-12 col-sm-12 col-md-6">
			<form name="formulario" method="post" enctype="multipart/form-data"
				action="/e-commerce-easports/ProdutoServlet?idProduto=${sessionScope.produto.idProduto} ">

				<input type="hidden" name="acao" value="editarproduto">
				<div class="jumbotron">
					<h2 class="center">Produto</h2>
					<hr />
					<div class="form-group">
						<label for="inputCodProd">Código do Produto</label> <input
							type="text" class="form-control" placeholder="Código"
							name="codigo" ng-model="cProduto" value="${sessionScope.produto.codigo}"
							ng-blur="validaProduto(cProduto)" disabled />
					</div>
					<div class="form-group">
						<label for="inputNomeProd">Nome</label> <input type="text"
							class="form-control" placeholder="Nome" name="nome"
							value="${sessionScope.produto.nome}" />
					</div>
					<div class="form-group">
						<label for="inputPrecoCustProd">Preço de Custo</label> <input
							type="text" class="form-control money" placeholder="R$0,00"
							name="precocusto" value="${sessionScope.produto.valorCustoFormatado}" />
					</div>
					<div class="form-group">
						<label for="inputPrecoVendProd">Preço de Venda</label> <input
							type="text" class="form-control money" placeholder="R$0,00"
							name="precovenda" value="${sessionScope.produto.valorVendaFormatado}" />
					</div>

					<div class="form-group">
						<label for="inputqtd">Quantidade</label> <input type="number"
							class="form-control" placeholder="5" name="quantidade"
							value="${sessionScope.produto.quantidade}" />
					</div>

					<div class="form-group">
						<label>Categoria: ${sessionScope.produto.categoria.nome}<select
							name="categoria" class="form-control" required>
								<option value="">- Selecione uma Opção -</option>
								<c:forEach items="${mbCategoria.listagemCategorias}" var="c">
									<option value="${c.idCategoria}">${c.nome}</option>
								</c:forEach>
						</select>
						</label>
					</div>
				</div>

				<div class="jumbotron">
					<h2 class="center">Informações adicionais</h2>
					<hr />
					<div class="form-group">
						<label>Origem: ${sessionScope.produto.origem}<select name="origem"
							class="form-control" required>
								<option value="">- Selecione uma Opção -</option>
								<option value="Nacional">Nacional</option>
								<option value="Importado">Importado</option>
						</select>
						</label>
					</div>

					<div class="form-group">
						<label for="inputCodProd">Dimensões</label> <input type="text"
							class="form-control" placeholder="EX: 29x44x14 (LxAxP) cm"
							name="dimensoes" value="${sessionScope.produto.dimensoes}" />
					</div>

					<div class="form-group">
						<label for="inputCodProd">Peso</label> <input type="text"
							class="form-control" placeholder="EX: 200g / 3kg" name="peso"
							value="${sessionScope.produto.peso}" />
					</div>

					<div class="form-group">
						<label for="inputCodProd">Garantia</label> <input type="text"
							class="form-control" placeholder="EX: 12 meses" name="garantia"
							value="${sessionScope.produto.garantia}" />
					</div>

					<div class="form-group">
						<label for="inputCodProd">Descrição</label> <input type="text"
							class="form-control" placeholder="Descrições do produto"
							name="descricao" value="${sessionScope.produto.descricao}" />
					</div>
					<div class="center">
						<button type="submit" class="btn btn-default">Alterar</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>

<div id="myModal" class="modal fade" role="dialog">
	<div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content center">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">${sessionScope.titulo}</h4>
			</div>
			<div class="modal-body">

				<h4>${sessionScope.mensagem}</h4>
				<h5>${sessionScope.erro }</h5>
				<!-- <h5><img src="/img/${imagem}.jpg" class="img-responsive"></h5>-->

			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default center"
					data-dismiss="modal">Fechar</button>
			</div>
		</div>
	</div>
</div>

<c:if test="${modal=='1'}">
	<script>
		$(document).ready(function() {
			$('#myModal').modal('show');
		});
	</script>
</c:if>
<c:remove scope="session" var="mensagem" />
<c:remove scope="session" var="modal" />
<c:remove scope="session" var="titulo" />
<c:remove scope="session" var="erro" />
<c:remove scope="session" var="produto" />
