<jsp:include page="cabecalho2.jsp"></jsp:include>
	<div class ="navbar navbar-default navbar-static-top">
        </div>
        <div class="container">
            <div class="row">

                <div class="col-xs-12 col-sm-12 col-md-6">              
                    <form>
                        <div class="jumbotron">

                            <div class="glyphicon glyphicon-shopping-cart" id="iconeCarrinho"></div>
                            <h4>0 Produtos</h4>
                            <h4>Total a pagar: R$0,00 </h4> 
                        </div>
                    </form>
                </div>

                <div class="col-xs-12 col-sm-12 col-md-6">
                    <div class="jumbotron">
                        <h3>Endereço de Entrega</h3>
                        <div class="glyphicon glyphicon-send" id="iconeEnvio"></div>
                        <address>
                            <strong>Elder Albuquerque</strong><br>
                            Rua Pedro Gonçalves Meira, 312 Jd. São Carlos<br>
                            So Paulo - SP, CEP 04433-250<br>                            
                            </address>
                        <button type="button" class="btn btn-default navbar-btn">Aterar Endereço</button>                    
                    </div>
                </div>
                <div class="col-xs-0 col-sm-0 col-md-3">                    
                </div>
                
                <div class="col-xs-12 col-sm-12 col-md-6">
                    <div class="jumbotron">
                        <h3>Cartão de Crédito</h3>
                        <div class="glyphicon glyphicon-credit-card" id="iconeCartao"></div>
                        <div class="form-group">
                            <label for="inputNumCartao">Número</label>
                            <input type="email" class="form-control" id="inputNumCartao" placeholder="Número">
                        </div>
                        <div class="form-group">
                            <label for="inputNomeCartao">Nome Impresso</label>
                            <input type="email" class="form-control" id="inputNomeCartao" placeholder="Nome">
                        </div>
                        <div class="form-group">
                            <label for="inputValidCartao">Validade</label>
                            <input type="email" class="form-control" id="inputValidCartao" placeholder="Data">
                        </div>
                        <div class="form-group">
                            <label for="inputCodSegCart">Código de Segurança</label>
                            <input type="email" class="form-control" id="inputCodSegCart" placeholder="Código">
                        </div>
                        <div class="form-group">
                            <label for="inputParcelas">Parcelar em:</label>
                            <input type="number" class="form-control" id="inputParcelas" placeholder="0">
                        </div>
                        
                        <button type="button" class="btn btn-default navbar-btn">Finalizar Compra</button>                    
                    </div>
                </div>
                
            </div>
        </div>

<jsp:include page="rodape.jsp"></jsp:include>