<h2 class="center">Dados Cadastrais</h2>

<p style="color: red; font-size: 10pt">${mensagemErro}</p>

<div class="form-group">
	<label for="inputCPF">Nome</label> <input type="text"
		class="form-control" id="inputCPF" placeholder="João das Neves"
		name="nome" required value="${cliente.nome}">
</div>

<div class="form-group">
	<label for="inputEmail">E-mail</label> <input type="email"
		class="form-control" id="inputEmail" placeholder="E-mail" name="email"
		required value="${cliente.email}" ng-model="cEmail"
		ng-blur="validaEmail(cEmail)">
</div>
<div class="form-group">
	<label for="inputSenha">Senha</label> <input type="password"
		class="form-control" id="inputSenha" placeholder="Senha" name="senha"
		required ng-model="senha">
</div>
<div class="form-group">
	<label for="inputSenhaC">Confirmar Senha</label> <input type="password"
		class="form-control" id="inputSenhaC" placeholder="Senha"
		name="confirmarsenha" ng-model="corfirmSenha" ng-blur="validarSenha()"
		required>
	<h6 ng-if="result" style="color: red;">Senhas não conferem. Repita
		a senha digita acima</h6>
</div>

<div class="form-group">
	<label for="inputCPF">CPF</label> <input type="text"
		class="form-control cpf" id="inputCPF" placeholder="000.000.000-00"
		name="cpf" required value="${cliente.cpf}" ng-model="cCpf"
		ng-blur="validaCpf(cCpf)">
</div>
<div class="form-group">
	<label for="inputDtNasc">Data de Nascimento</label> <input type="date"
		class="form-control" id="inputDtNasc" placeholder="dd/mm/aaaa"
		name="datanasc" required value="${cliente.dataNascimento}">
</div>
<div class="form-group">
	<label for="inputCPF">Telefone</label> <input type="text"
		class="form-control telefone" id="phone" placeholder="11 1223-5524"
		name="telefone" required value="${cliente.telefone}">
</div>
<div class="form-group">
	<label for="inputRadio1">Sexo</label> <label class="radio-inline">
		<input type="radio" id="inlineRadio1" value="M" name="sexo" checked>
		M
	</label> <label class="radio-inline"> <input type="radio"
		id="inlineRadio2" value="F" name="sexo" required> F
	</label>
</div>