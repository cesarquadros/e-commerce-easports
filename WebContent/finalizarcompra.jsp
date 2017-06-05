<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="cabecalho2.jsp"></jsp:include>
<link rel="stylesheet" href="./css/stepbar.css" />
<link rel="stylesheet" href="./css/radio.css" />

<div ng-app="app" ng-controller="appCtrl">

	<div class="container-fluid">

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
						class="	glyphicon glyphicon-usd"></span>
					</a>
					<p>Pagamento</p>
				</div>

				<div class="stepwizard-step">
					<button type="button" class="btn btn-default btn-circle"
						disabled="disabled">
						<span class="glyphicon glyphicon-ok"></span>
					</button>
					<p>Confirmação</p>
				</div>
			</div>
		</div>
		<br /> <br />

		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-8">
				<table class="table table-hover">
					<thead>
						<tr style="background: #eee;">
							<th>Itens</th>
							<th>Quantidade</th>
							<th>Valor</th>
						</tr>
					</thead>
					<c:forEach items="${carrinhocount}" var="carrinho">
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
							<td>${valorTotalFormatado}</td>
						</tr>
					</tbody>
				</table>
			</div>

			<div class="col-xs-12 col-sm-12 col-md-4">
				<div class="jumbotron">
					<h4>Endereço de Entrega</h4>
					<address>
						<strong>${cliente.nome}</strong><br>
						${cliente.endereco.logradouro}, ${cliente.endereco.numero}
						(${cliente.endereco.complemento})- ${cliente.endereco.bairro}<br>
						${cliente.endereco.cidade} - ${cliente.endereco.estado},
						${cliente.endereco.cep}<br>
					</address>
					<div class="center">
						<button type="button" class="btn btn-default navbar-btn"
							id="btnEnd">Aterar Endereço</button>
					</div>
				</div>
			</div>

		</div>
		<br />
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-8">
				<div class="">
					<h4>Cartão de Crédito</h4>
				</div>

				<table class="table table-hover" style="border: solid 1px gray;">
					<thead>
						<tr style="background: #eee;">
							<th><div class="glyphicon glyphicon-credit-card center"
									id="iconeCartao"></div></th>
							<th>Número</th>
							<th>Titular</th>
							<th>Validade</th>

						</tr>
					</thead>
					<tbody style="font-size: 12px;">
						<tr>
							<td></td>
							<td>${cliente.cartao.numeroX}</td>
							<td>${cliente.cartao.nomeImpresso}</td>
							<td>${cliente.cartao.validadeFormatada}</td>

						</tr>
					</tbody>
				</table>
				<div>

					<button type="button" class="btn btn-default navbar-btn"
						id="btnCard" ng-show="hideCard('${cliente.cartao.nomeImpresso}')">Aterar
						cartão</button>


					<button type="submit" class="btn btn-success navbar-btn"
						ng-show="showCard('${cliente.cartao.nomeImpresso}')"
						id="btnCardInsert">Inserir Cartão</button>

					<form name="formulario" method="post"
						action="/e-commerce-easports/ComprarProdutoServlet?acao=comprar&formapagamento=cartao">
						<div class="form-group" style="font-size: 12pt;">
							<select required="required" name="parcelas" class="form-control">
								<option value="1">Á vista
									{{parcelar('${valorTotal}',1)| number:2}}</option>
								<option value="2">2x de R$
									{{parcelar('${valorTotal}',2)| number:2}}</option>
								<option value="3">3x de R$
									{{parcelar('${valorTotal}',3) | number:2}}</option>
								<option value="4">4x de R$
									{{parcelar('${valorTotal}',4) | number:2}}</option>
								<option value="5">5x de R$
									{{parcelar('${valorTotal}',5) | number:2}}</option>
							</select>
							<button type="submit" class="btn btn-success navbar-btn"
								ng-show="hideCard('${cliente.cartao.nomeImpresso}')"
								id="finalizarCompraCard">Finalizar compra com cartão</button>
						</div>
					</form>
				</div>
			</div>
<!--
			<div class="col-xs-12 col-sm-12 col-md-4">
				<div class="">
					<h4>Pagamento boleto</h4>
				</div>
				<table class="table table-hover" style="border: solid 1px gray;">
					<thead>
						<tr style="background: #eee;">
							<th><img src="./imagens_projeto/boleto.png"></th>
							<th>Pagamento</th>
							<th></th>
							<th>Total</th>
						</tr>
					</thead>
					<tbody style="font-size: 12px;">
						<tr>
							<td></td>
							<td>Á vista</td>
							<td></td>
							<td>${valorTotalFormatado}</td>
						</tr>
					</tbody>
				</table>
				 <a
					href="/e-commerce-easports/ComprarProdutoServlet?acao=comprar&formapagamento=boleto&parcelas=1"
					type="button" class="btn btn-primary navbar-btn"> Finalizar
					compra com boleto </a> -->
			</div>
			</form>
		</div>
	</div>


	<!-- ------------------------------------------------------------------------------  MODAL EDITAR CARTAO ------------------------------------------------------->

	<div id="myModal2" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h2 class="modal-title center">Alterar Cartão</h2>
				</div>
				<div class="modal-body">
					<div class="jumbotron">
						<form name="formulario" method="post"
							action="/e-commerce-easports/CartaoServlet?acao=update&page=finalizarcompra">
							<jsp:include page="formcartaoupdate.jsp"></jsp:include>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- ------------------------------------------------------------------------------  MODAL INSERIR CARTAO ------------------------------------------------------->

	<div id="myModal3" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h2 class="modal-title center">Alterar Cartão</h2>
				</div>
				<div class="modal-body">
					<div class="jumbotron">
						<form name="formulario" method="post"
							action="/e-commerce-easports/CartaoServlet?acao=insert&page=finalizarcompra">
							<jsp:include page="formcartaoinsert.jsp"></jsp:include>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- ------------------------------------------------------------------------------MODAL ENDEREÇO ------------------------------------------------------->

	<div id="myModal" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h2 class="modal-title center">Alterar endereço</h2>
				</div>
				<div class="modal-body">
					<div class="jumbotron">
						<form name="formulario" method="post"
							action="/e-commerce-easports/ClienteServlet?acao=updateendereco&page=finalizarcompra">
							<jsp:include page="formendereco.jsp"></jsp:include>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- ------------------------------------------------------------------------------ FIM MODAL ENDEREÇO ------------------------------------------------------->
</div>

<script>
	$(document).ready(function() {
		$("#btnEnd").click(function() {
			$("#myModal").modal();
		});
	});
</script>
<script>
	$(document).ready(function() {
		$("#btnCard").click(function() {
			$("#myModal2").modal();
		});
	});
</script>
<script>
	$(document).ready(function() {
		$("#btnCardInsert").click(function() {
			$("#myModal3").modal();
		});
	});
</script>
<br />
<br />
<br />
<jsp:include page="rodape.jsp"></jsp:include>