                        <div class="jumbotron">
                            <h2 class="center" >Produto</h2>
                            <hr />
                            <div class="form-group">
                                <label for="inputCodProd">C�digo do Produto</label>
                                <input type="text" class="form-control" placeholder="C�digo" name="codigo" required ng-model="cProduto" ng-blur="validaProduto(cProduto)"/>
                            </div>
                            <div class="form-group">
                                <label for="inputNomeProd">Nome</label>
                                <input type="text" class="form-control" placeholder="Nome" name="nome" required/>
                            </div>
                            <div class="form-group">
                                <label for="inputPrecoCustProd">Pre�o de Custo</label>
                                <input type="text" class="form-control" placeholder="R$0,00" name="precocusto" required/>
                            </div>
                            <div class="form-group">
                                <label for="inputPrecoVendProd">Pre�o de Venda</label>
                                <input type="text" class="form-control"  placeholder="R$0,00" name="precovenda" required/>
                            </div>
                            
                            <div class="form-group">
                                <label for="inputqtd">Quantidade</label>
                                <input type="number" class="form-control"  placeholder="5" name="quantidade" required/>
                            </div>
                          
                          <div class="form-group">
							<label>Categoria:
								<select required="required" name="categoria" class="form-control">
									<option value="">- Selecione uma Op��o -</option>
									<c:forEach items="${mbCategoria.listagemCategorias}" var="c">
										<option value="${c.idCategoria}"> ${c.nome} </option>
									</c:forEach>
								</select>
							</label>                          
                          </div>                         
                            
                            <div class="form-group">
                                <label for="exampleInputFile">Inserir Foto</label>
                                <input type="file" id="inputFotoProd"name="img" required>
                            </div>

                        </div>
                        
                        <div class="jumbotron">
                        	<h2 class="center" >Informa��es adicionais</h2>
                        	<hr />
                        	 <div class="form-group">
							<label>Origem:
								<select required="required" name="origem" class="form-control">
									<option value="">- Selecione uma Op��o -</option>
										<option value="Nacional"> Nacional </option>
										<option value="Importado"> Importado</option>
								</select>
							</label>                          
                          </div> 
                            
                            <div class="form-group">
                                <label for="inputCodProd">Dimens�es</label>
                                <input type="text" class="form-control" placeholder="EX: 29x44x14 (LxAxP) cm" name="dimensoes"/>
                            </div>
                            
                            <div class="form-group">
                                <label for="inputCodProd">Peso</label>
                                <input type="text" class="form-control" placeholder="EX: 200g / 3kg" name="peso"/>
                            </div>
                            
                            <div class="form-group">
                                <label for="inputCodProd">Garantia</label>
                                <input type="text" class="form-control" placeholder="EX: 12 meses" name="garantia"/>
                            </div>
                            
                            <div class="form-group">
                                <label for="inputCodProd">Descri��o</label>
                                <input type="text" class="form-control" placeholder="Descri��es do produto" name="descricao"/>
                            </div>
                            <div class="center"><button type="submit" class="btn btn-default">Cadastrar</button></div>
                        </div>