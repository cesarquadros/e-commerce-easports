
<jsp:include page="cabecalho3.jsp"></jsp:include>
<br />
<br />
<br />
<div class="container">

	<div class="row">

		<div class="col-xs-12 col-sm-12 col-md-2" style="background: #eee; padding-top: 20px;">
			<div class="row">
				<div class="col-xs-12 col-sm-12 col-md-12">
					<img alt="avatar" src="./imagens_projeto/avatar.jpg">
				</div>
			</div>
			<div class="row">
				<div class="col-xs-12 col-sm-12 col-md-12">
					<h4>Olá ${cliente.nome}</h4>
				</div>
			</div>
			<div class="row">
				<div class="col-xs-12 col-sm-12 col-md-12">
					<p>${cliente.email}</p>
				</div>
			</div>
		</div>

		<div class="col-xs-12 col-sm-12 col-md-9">
			<div class="row">
				<div class="col-xs-12 col-sm-12 col-md-12">
					<h4>MEUS PEDIDOS</h4>
					<ul>
						<li><a href="#">Relatorio de compras</a></li>
					</ul>
					<hr />
					<br />
				</div>
			</div>
			<div class="row">
				<div class="col-xs-12 col-sm-12 col-md-12">
					<h4>MEUS DADOS</h4>
					<ul>
						<li><a href="#">Dados pessoais</a></li>
						<li><a href="#">Endereço</a></li>
						<li><a href="#">Alterar senha</a></li>
					</ul>
					<hr />
					<br />
				</div>
			</div>
		</div>
	</div>
</div>