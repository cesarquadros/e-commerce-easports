<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.11/jquery.mask.js" type="text/javascript"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.11/jquery.mask.min.js" type="text/javascript"></script>
<script src="./js/mask.js"></script>

		<div class="form-group">
			<label for="inputNumCartao">N�mero</label> <input 
				class="form-control cartao" id="inputNumCartao" name="numero"
				placeholder="N�mero" value="${usuarioLogado.cartao.numero}">
		</div>
		<div class="form-group">
			<label for="inputNomeCartao">Nome Impresso</label> <input type="text"
				class="form-control" id="inputNomeCartao" placeholder="Nome"
				name="nome" value="${usuarioLogado.cartao.nomeImpresso}">
		</div>
		<div class="form-group">
			<label for="inputValidCartao">Validade</label> <input type="text"
				class="form-control validadecartao" id="inputValidCartao" placeholder="01/2020"
				name="data" value="${usuarioLogado.cartao.validade}">
		</div>
		<div class="form-group">
			<label for="inputCodSegCart">C�digo de Seguran�a</label> <input
				type="text" class="form-control codseguranca" id="inputCodSegCart"
				placeholder="C�digo" name="codigo" value="${usuarioLogado.cartao.codigoSeguranca}">
		</div>

		<div class="center">
			<button type="submit" class="btn btn-primary">Cadastrar</button>
			<button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
		</div>
