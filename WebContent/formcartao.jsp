
<div class="jumbotron">
	<form name="formulario" method="post"
		action="/e-commerce-easports/CartaoServlet?acao=update">
		<div class="form-group">
			<label for="inputNumCartao">N�mero</label> <input type="number"
				class="form-control" id="inputNumCartao" name="numero"
				placeholder="N�mero">
		</div>
		<div class="form-group">
			<label for="inputNomeCartao">Nome Impresso</label> <input type="text"
				class="form-control" id="inputNomeCartao" placeholder="Nome"
				name="nome">
		</div>
		<div class="form-group">
			<label for="inputValidCartao">Validade</label> <input type="date"
				class="form-control" id="inputValidCartao" placeholder="Data"
				name="data">
		</div>
		<div class="form-group">
			<label for="inputCodSegCart">C�digo de Seguran�a</label> <input
				type="text" class="form-control" id="inputCodSegCart"
				placeholder="C�digo" name="codigo">
		</div>

		<div class="center">
			<button type="submit" class="btn btn-primary">Cadastrar</button>
			<button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
		</div>
	</form>
</div>