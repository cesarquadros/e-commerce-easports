<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fnc"%>

<jsp:include page="cabecalho2.jsp"></jsp:include>

<div class="container">
	<div class="row">

		<div class="col-xs-12 col-sm-12 col-md-6">
			<form method="post" action="/e-commerce-easports/ClienteServlet?acao=autenticar">
				<div class="jumbotron ">
					<h2 class="center">Já tenho cadastro</h2>
					<div class="form-group">
						<label for="inputEmail">E-mail</label> 
						<input type="email"	class="form-control" id="email" name="email" placeholder="E-mail">
					</div>
					<div class="form-group">
						<label for="inputSenha">Senha</label> 
						<input type="password" class="form-control" id="senha" name="senha" placeholder="Senha">
					</div>
					<div class="center">
						<button type="submit" class="btn btn-primary center">Entrar</button>
					</div>
				</div>
			</form>
		</div>

		<div class="col-xs-12 col-sm-12 col-md-6 center">
			<div class="jumbotron">
				<h2>Não tenho cadastro</h2>
				<div class="glyphicon glyphicon-user" id="iconeUsuario"></div>
				<br /> <a href="cadastrocliente.jsp"
					class="btn btn-primary navbar-btn">Criar Cadastro</a>
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
					
					<h2>${mensagem}</h2>
					<h3>${retorno}</h3>
					
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
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

</div>
<jsp:include page="rodape.jsp"></jsp:include>