
		<div class="form-group">
			<label for="inputCEP" class="">CEP</label> <input type="text"
				class="form-control" id="inputCep" placeholder="00000-000" 
				name="cep" required ng-model="cCep" ng-blur="validaCep(cCep,'')" />
		</div>
		<div class="form-group">
			<label for="inputLogradouro">Logradouro</label> <input type="text"
				class="form-control" id="inputLogradouro"
				placeholder="Ex.: Rua: xxxxx" name="logradouro"
				value="{{array.logradouro}}" value=" ${cliente.endereco.logradouro}" required>
		</div>
		<div class="form-group">
			<label for="inputNumero">Número</label> <input type="number"
				class="form-control" id="inputNumero" placeholder="Número"
				name="numero" value="${cliente.endereco.numero}" required>
		</div>
		<div class="form-group">
			<label for="inputComplemento">Complemento </label> <input type="text"
				class="form-control" id="inputComplemento" placeholder="Complemento"
				name="complemento" value="${cliente.endereco.complemento}">
		</div>
		<div class="form-group">
			<label for="inputBairro">Bairro</label> <input type="text"
				class="form-control" id="inputBairro" placeholder="Bairro"
				name="bairro" value="{{array.bairro}}" value=" ${cliente.endereco.bairro}" required>
		</div>
		<div class="form-group">
			<label for="inputCidade">Cidade</label> <input type="text"
				class="form-control" id="inputCidade" placeholder="Cidade"
				name="cidade" value="{{array.cidade}}" value="${cliente.endereco.cidade}" required>
		</div>
		<div class="form-group">
			<label for="inputEstado">Estado</label> <input type="text"
				class="form-control" id="inputEstado" placeholder="Estado"
				name="estado" value="{{array.estado}}" value=" ${cliente.endereco.estado}" required>
		</div>
		<div class="center">
			<button type="submit" class="btn btn-primary">Cadastrar</button>
			<button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
		</div>
