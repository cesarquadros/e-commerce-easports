	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<jsp:include page="cabecalho2.jsp"></jsp:include>
	
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	
 <div class ="navbar navbar-default navbar-static-top">
        </div>
        <div class="container">
            <div class="row">
                <div class="col-xs-0 col-sm-0 col-md-3">                    
                </div>
                <div class="col-xs-12 col-sm-12 col-md-6">              
                   <form name="formulario" method="post" enctype="multipart/form-data" action="/e-commerce-easports/ProdutoServlet">
                   
                   <input type="hidden" name="acao" value="cadastrar">
                        <div class="jumbotron">
                            <h2 class="center" >Produto</h2>
                            <div class="form-group">
                                <label for="inputCodProd">Código do Produto</label>
                                <input type="text" class="form-control" placeholder="Código" name="codigo"/>
                            </div>
                            <div class="form-group">
                                <label for="inputNomeProd">Nome</label>
                                <input type="text" class="form-control" placeholder="Nome" name="nome"/>
                            </div>
                            <div class="form-group">
                                <label for="inputPrecoCustProd">Preço de Custo</label>
                                <input type="text" class="form-control" placeholder="R$0,00" name="precocusto"/>
                            </div>
                            <div class="form-group">
                                <label for="inputPrecoVendProd">Preço de Venda</label>
                                <input type="text" class="form-control"  placeholder="R$0,00" name="precovenda"/>
                            </div>
                          
                          <div class="form-group">
							<label>Categoria:
								<select required="required" name="categoria" class="form-control">
									<option value="">- Selecione uma Opção -</option>

									<option value="1"> Futebol </option>
									<option value="2"> Volei </option>
									<option value="3"> Baseball </option>
									<option value="4"> Natação </option>
									
								</select>
							</label>                          
                          </div>                         
                            <div class="form-group">
                                <label for="exampleInputFile">Inserir Foto</label>
                                <input type="file" id="inputFotoProd"name="img">
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