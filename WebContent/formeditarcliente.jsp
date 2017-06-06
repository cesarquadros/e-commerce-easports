<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.11/jquery.mask.js" type="text/javascript"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.11/jquery.mask.min.js" type="text/javascript"></script>
<script src="./js/mask.js"></script>				
					<h2 class="center">Dados Cadastrais</h2>
				
					<p style="color: red; font-size: 10pt">${mensagemErro}</p>
					
					<div class="form-group">
						<label for="inputCPF">Nome</label> 
						<input type="text" class="form-control" id="inputCPF" placeholder="João das Neves" name="nome" disabled value="${sessionScope.cliente.nome}">
					</div>
					
					<div class="form-group">
						<label for="inputEmail">E-mail</label> <input type="email"
							class="form-control" id="inputEmail" placeholder="E-mail"
							name="email" required value="${sessionScope.cliente.email}" disabled >
					</div>

					<div class="form-group">
						<label for="inputCPF">CPF</label> <input type="text"
							class="form-control" id="inputCPF" placeholder="000.000.000-00"
							name="cpf" required value="${sessionScope.cliente.cpf}"  disabled >
					</div>
					<div class="form-group">
						<label for="inputDtNasc">Data de Nascimento</label> <input
							type="text" class="form-control" id="inputDtNasc"
							placeholder="dd/mm/aaaa" name="datanasc" disabled value="${sessionScope.cliente.dataNascFormatada}">
					</div>
					<div class="form-group">
						<label for="inputCPF">Telefone</label> <input type="text"
							class="form-control telefone" id="inputCPF" placeholder="11 1223-5524"
							name="telefone" required value="${sessionScope.cliente.telefone}">
					</div>
					<div class="form-group">
						<label for="inputRadio1">Sexo</label> <label class="radio-inline">
							<input type="radio" id="inlineRadio1" value="M" name="sexo"
							checked> M
						</label> <label class="radio-inline"> <input type="radio"
							id="inlineRadio2" value="F" name="sexo" disabled> F
						</label>
					</div>