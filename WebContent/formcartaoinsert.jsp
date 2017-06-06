<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.11/jquery.mask.js" type="text/javascript"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.11/jquery.mask.min.js" type="text/javascript"></script>
<script src="./js/mask.js"></script>

		<div class="form-group">
			<label for="inputNumCartao">Número</label> <input type="number"
				class="form-control cartao" id="inputNumCartao" name="numero"
				placeholder="Número">
		</div>
		<div class="form-group">
			<label for="inputNomeCartao">Nome Impresso</label> <input type="text"
				class="form-control" id="inputNomeCartao" placeholder="Nome"
				name="nome" >
		</div>
		<div class="form-group">
			<label for="inputValidCartao">Validade</label> <input type="text"
				class="form-control validadecartao" id="inputValidCartao" placeholder="01/2020"
				name="data">
		</div>
		<div class="form-group">
			<label for="inputCodSegCart">Código de Segurança</label> <input
				type="text" class="form-control codseguranca" id="inputCodSegCart"
				placeholder="Código" name="codigo" >
		</div>

		<div class="center">
			<button type="submit" class="btn btn-primary">Cadastrar</button>
			<button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
		</div>
