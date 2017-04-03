	<jsp:include page="cabecalho2.jsp"></jsp:include>

        <div class ="navbar navbar-default navbar-static-top">
        </div>
        <div class="container">
            <div class="row">
                <div class="col-xs-0 col-sm-0 col-md-3">                    
                </div>
                <div class="col-xs-12 col-sm-12 col-md-6">              
                    <form>
                        <div class="jumbotron">
                        <h2> Dados Cadastrais</h2>
                        <div class="form-group">
                            <label for="inputEmail">E-mail</label>
                            <input type="email" class="form-control" id="inputEmail" placeholder="E-mail">
                        </div>
                        <div class="form-group">
                            <label for="inputSenha">Senha</label>
                            <input type="password" class="form-control" id="inputSenha" placeholder="Senha">
                        </div>
                        <div class="form-group">
                            <label for="inputSenhaC">Confirmar Senha</label>
                            <input type="password" class="form-control" id="inputSenhaC" placeholder="Senha">
                        </div>
                        <div class="form-group">
                            <label for="inputRadio1">Sexo</label>
                            <label class="radio-inline">
                                <input type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1"> M
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2"> F
                            </label>
                        </div>
                        <div class="form-group">
                            <label for="inputCPF">CPF</label>
                            <input type="email" class="form-control" id="inputCPF" placeholder="000.000.000-00">
                        </div>
                        <div class="form-group">
                            <label for="inputDtNasc">Data de Nascimento</label>
                            <input type="email" class="form-control" id="inputDtNasc" placeholder="dd/mm/aaaa">
                        </div>
                        </div>
                        <div class="jumbotron">
                        <h2>Endereço</h2>                        
                        <div class="form-group">
                            <label for="inputCEP">CEP</label>
                            <input type="email" class="form-control" id="inputCep" placeholder="00000-000">
                        </div>
                        <div class="form-group">
                            <label for="inputLogradouro">Logradouro</label>
                            <input type="email" class="form-control" id="inputLogradouro" placeholder="Ex.: Rua: xxxxx">
                        </div>
                        <div class="form-group">
                            <label for="inputNumero">Número</label>
                            <input type="number" class="form-control" id="inputNumero" placeholder="Número">
                        </div>
                        <div class="form-group">
                            <label for="inputComplemento">Complemento</label>
                            <input type="email" class="form-control" id="inputComplemento" placeholder="Complemento">
                        </div>
                        <div class="form-group">
                            <label for="inputBairro">Bairro</label>
                            <input type="email" class="form-control" id="inputBairro" placeholder="Bairro">
                        </div>
                        <div class="form-group">
                            <label for="inputCidade">Cidade</label>
                            <input type="email" class="form-control" id="inputCidade" placeholder="Cidade">
                        </div>
                        <div class="form-group">
                            <label for="inputEstado">Estado</label>
                            <input type="email" class="form-control" id="inputEstado" placeholder="Estado">
                        </div>
                        <button type="submit" class="btn btn-default">Cadastrar</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
		
      	<jsp:include page="rodape.jsp"></jsp:include>