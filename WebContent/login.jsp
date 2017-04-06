<jsp:include page="cabecalho2.jsp"></jsp:include>
<div class="navbar navbar-default navbar-static-top"></div>
<div class="container">
	<div class="row">

		<div class="col-xs-12 col-sm-12 col-md-6">
			<form>
				<div class="jumbotron ">
					<h2 class="center">Já tenho cadastro</h2>
					<div class="form-group">
						<label for="inputEmail">E-mail</label> <input type="email"
							class="form-control" id="inputEmail" placeholder="E-mail">
					</div>
					<div class="form-group">
						<label for="inputSenha">Senha</label> <input type="password"
							class="form-control" id="inputSenha" placeholder="Senha">
					</div>
					<div class="center">
						<a href="#" type="submit" class="btn btn-primary center">Entrar</a>
					</div>
				</div>
			</form>
		</div>

		<div class="col-xs-12 col-sm-12 col-md-6 center">
			<div class="jumbotron">
				<h2>Não tenho cadastro</h2>
				<div class="glyphicon glyphicon-user" id="iconeUsuario"></div>
				<br /> <a href="cadastrocliente.jsp"
					class="btn btn-primary navbar-btn">Criar Cadastro</a>
			</div>
		</div>
	</div>
</div>
<jsp:include page="rodape.jsp"></jsp:include>