
<jsp:include page="cabecalho2.jsp"></jsp:include>

<div class="container" ng-app="app" ng-controller="appCtrl">
	<div class="row">
		<div class="col-xs-0 col-sm-0 col-md-3"></div>
		<div class="col-xs-12 col-sm-12 col-md-6">
			<form name="formulario" method="post" action="/e-commerce-easports/ClienteServlet?acao=cadastrar">
				<div class="jumbotron">
					<h2 class="center">Dados Cadastrais</h2>
					
					<div class="form-group">
						<label for="inputCPF">Nome</label> 
						<input type="text" class="form-control" id="inputCPF" placeholder="João das Neves" name="nome" required>
					</div>
					
					<div class="form-group">
						<label for="inputEmail">E-mail</label> <input type="email"
							class="form-control" id="inputEmail" placeholder="E-mail"
							name="email" required>
					</div>
					<div class="form-group">
						<label for="inputSenha">Senha</label> <input type="password"
							class="form-control" id="inputSenha" placeholder="Senha"
							name="senha" required>
					</div>
					<div class="form-group">
						<label for="inputSenhaC">Confirmar Senha</label> <input
							type="password" class="form-control" id="inputSenhaC"
							placeholder="Senha" name="confirmarsenha" required>
					</div>

					<div class="form-group">
						<label for="inputCPF">CPF</label> <input type="text"
							class="form-control" id="inputCPF" placeholder="000.000.000-00"
							name="cpf" required>
					</div>
					<div class="form-group">
						<label for="inputDtNasc">Data de Nascimento</label> <input
							type="date" class="form-control" id="inputDtNasc"
							placeholder="dd/mm/aaaa" name="datanasc" required>
					</div>
					<div class="form-group">
						<label for="inputCPF">Telefone</label> <input type="text"
							class="form-control" id="inputCPF" placeholder="11 1223-5524"
							name="telefone" required>
					</div>
					<div class="form-group">
						<label for="inputRadio1">Sexo</label> <label class="radio-inline">
							<input type="radio" id="inlineRadio1" value="M" name="sexo"
							checked> M
						</label> <label class="radio-inline"> <input type="radio"
							id="inlineRadio2" value="F" name="sexo" required> F
						</label>
					</div>
				</div>
				<div class="jumbotron">
					<h2 class="center">Endereço</h2>
					<div class="form-group">
						<label for="inputCEP">CEP</label> 
						<input type="text" class="form-control" id="inputCep" placeholder="00000-000" name="cep" required ng-model="cCep"ng-blur="validaCep(cCep,'')"/>
					</div>
					<div class="form-group">
						<label for="inputLogradouro">Logradouro</label> <input type="text"
							class="form-control" id="inputLogradouro"
							placeholder="Ex.: Rua: xxxxx" name="logradouro" value="{{array.logradouro}}" required>
					</div>
					<div class="form-group">
						<label for="inputNumero">Número</label> <input type="number"
							class="form-control" id="inputNumero" placeholder="Número"
							name="numero" required>
					</div>
					<div class="form-group">
						<label for="inputComplemento">Complemento </label> <input
							type="text" class="form-control" id="inputComplemento"
							placeholder="Complemento" name="complemento" required>
					</div>
					<div class="form-group">
						<label for="inputBairro">Bairro</label> <input type="text"
							class="form-control" id="inputBairro" placeholder="Bairro"
							name="bairro" value="{{array.bairro}}" required>
					</div>
					<div class="form-group">
						<label for="inputCidade">Cidade</label> <input type="text"
							class="form-control" id="inputCidade" placeholder="Cidade"
							name="cidade" value="{{array.cidade}}" required>
					</div>
					<div class="form-group">
						<label for="inputEstado">Estado</label> <input type="text"
							class="form-control" id="inputEstado" placeholder="Estado"
							name="estado" value="{{array.estado}}" required>
					</div>
					<div class="center">
						<button type="submit" class="btn btn-default">Cadastrar</button>
					</div>
				</div>
			</form>
		</div>
	</div>

</div>

<jsp:include page="rodape.jsp"></jsp:include>