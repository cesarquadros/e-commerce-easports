	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<jsp:include page="cabecalho2.jsp"></jsp:include>
		<jsp:useBean class="br.com.ecommerceeasports.managedbean.ManagedBeanCategoria" id="mbCategoria"></jsp:useBean>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	
        <div class="container">
            <div class="row">
                <div class="col-xs-0 col-sm-0 col-md-3">                    
                </div>
                <div class="col-xs-12 col-sm-12 col-md-6">              
                   <form name="formulario" method="post" enctype="multipart/form-data" action="/e-commerce-easports/ProdutoServlet">
                   
                   <input type="hidden" name="acao" value="cadastrar">
                        <div class="jumbotron">
                            <h2 class="center" >Produto</h2>
                            <hr />
                            <div class="form-group">
                                <label for="inputCodProd">Código do Produto</label>
                                <input type="text" class="form-control" placeholder="Código" name="codigo" required/>
                            </div>
                            <div class="form-group">
                                <label for="inputNomeProd">Nome</label>
                                <input type="text" class="form-control" placeholder="Nome" name="nome" required/>
                            </div>
                            <div class="form-group">
                                <label for="inputPrecoCustProd">Preço de Custo</label>
                                <input type="text" class="form-control" placeholder="R$0,00" name="precocusto" required/>
                            </div>
                            <div class="form-group">
                                <label for="inputPrecoVendProd">Preço de Venda</label>
                                <input type="text" class="form-control"  placeholder="R$0,00" name="precovenda" required/>
                            </div>
                          
                          <div class="form-group">
							<label>Categoria:
								<select required="required" name="categoria" class="form-control">
									<option value="">- Selecione uma Opção -</option>
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
                        	<h2 class="center" >Informações adicionais</h2>
                        	<hr />
                        	 <div class="form-group">
							<label>Categoria:
								<select required="required" name="origem" class="form-control">
									<option value="">- Selecione uma Opção -</option>
										<option value="Nacional"> Nacional </option>
										<option value="Importado"> Importado</option>
								</select>
							</label>                          
                          </div> 
                            
                            <div class="form-group">
                                <label for="inputCodProd">Dimensões</label>
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
                                <label for="inputCodProd">Descrição</label>
                                <input type="text" class="form-control" placeholder="Descrições do produto" name="descricao"/>
                            </div>
                            <div class="center"><button type="submit" class="btn btn-default">Cadastrar</button></div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        
        <div id="myModal" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content center">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">${titulo}</h4>
				</div>
				<div class="modal-body">
					
					<h4>${mensagem}</h4>
					<h5>${erro }</h5>
					<h5><img src="/img/${imagem}.jpg" class="img-responsive"></h5>
					
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default center" data-dismiss="modal">Fechar</button>
				</div>
			</div>
		</div>
	</div>
	<c:if test="${modal=='1'}">
		<script>
			$(document).ready(function() {
				$('#myModal').modal('show');
			});
		</script>
	</c:if>

<jsp:include page="rodape.jsp"></jsp:include>