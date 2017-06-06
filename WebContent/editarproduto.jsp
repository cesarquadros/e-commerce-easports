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
	
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script src="masks.js" type="text/javascript"></script>

<div class="container">
	<div class="row">
		<div class="col-xs-12 col-sm-12 col-md-4">
			<img src="img/${produto.imagem}" class="img-responsive"
				style="max-width: 70%;" />
		</div>

		<div class="col-xs-12 col-sm-12 col-md-6">
			<form name="formulario" method="post" enctype="multipart/form-data"
				action="/e-commerce-easports/ProdutoServlet?idProduto=${produto.idProduto} ">

				<input type="hidden" name="acao" value="editarproduto">
				<div class="jumbotron">
					<h2 class="center">Produto</h2>
					<hr />
					<div class="form-group">
						<label for="inputCodProd">Código do Produto</label> <input
							type="text" class="form-control" placeholder="Código"
							name="codigo" ng-model="cProduto" value="${produto.codigo}"
							ng-blur="validaProduto(cProduto)" disabled/>
					</div>
					<div class="form-group">
						<label for="inputNomeProd">Nome</label> <input type="text"
							class="form-control" placeholder="Nome" name="nome"
							value="${produto.nome}" />
					</div>
					<div class="form-group">
						<label for="inputPrecoCustProd">Preço de Custo</label> <input
							type="text" class="form-control money" placeholder="R$0,00"
							name="precocusto" value="${produto.valorCustoFormatado}" />
					</div>
					<div class="form-group">
						<label for="inputPrecoVendProd">Preço de Venda</label> <input
							type="text" class="form-control money" placeholder="R$0,00"
							name="precovenda" value="${produto.valorVendaFormatado}" />
					</div>

					<div class="form-group">
						<label for="inputqtd">Quantidade</label> <input type="number"
							class="form-control" placeholder="5" name="quantidade"
							value="${produto.quantidade}" />
					</div>

					<div class="form-group">
						<label>Categoria: ${produto.categoria.nome}<select
							name="categoria" class="form-control" required>
								<option value="">- Selecione uma Opção -</option>
								<c:forEach items="${mbCategoria.listagemCategorias}" var="c">
									<option value="${c.idCategoria}">${c.nome}</option>
								</c:forEach>
						</select>
						</label>
					</div>

					<div class="form-group">
						<label for="exampleInputFile">Inserir Foto</label> <input
							type="file" id="inputFotoProd" name="img" >
					</div>
				</div>

				<div class="jumbotron">
					<h2 class="center">Informações adicionais</h2>
					<hr />
					<div class="form-group">
						<label>Origem: ${produto.origem}<select name="origem"
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
							name="dimensoes" value="${produto.dimensoes}"  />
					</div>

					<div class="form-group">
						<label for="inputCodProd">Peso</label> <input type="text"
							class="form-control" placeholder="EX: 200g / 3kg" name="peso"
							value="${produto.peso}"  />
					</div>

					<div class="form-group">
						<label for="inputCodProd">Garantia</label> <input type="text"
							class="form-control" placeholder="EX: 12 meses" name="garantia"
							value="${produto.garantia}"  />
					</div>

					<div class="form-group">
						<label for="inputCodProd">Descrição</label> <input type="text"
							class="form-control" placeholder="Descrições do produto"
							name="descricao" value="${produto.descricao}"  />
					</div>
					<div class="center">
						<button type="submit" class="btn btn-default">Alterar</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>

