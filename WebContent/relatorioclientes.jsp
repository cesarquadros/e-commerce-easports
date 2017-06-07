<jsp:include page="cabecalhobackoffice.jsp"></jsp:include>
<jsp:include page="menubackoffice.jsp"></jsp:include>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fnc"%>

<div class="container">
	<div class="row">
		<div class="col-xs-12 col-sm-12 col-md-12">
			<h1 class="center">Relatório de Clientes</h1>
			<br /> 

			<br />
			<table class="table table-hover">
				<thead>
					<tr style="background: #eee;">
						<th>ID</th>
						<th>Nome</th>
						<th>Email</th>
						<th>Telefone</th>
					</tr>
				</thead>
				<c:forEach items="${listaclientes}" var="lista">
					<tbody>
						<tr>
							<td></td>
						</tr>
					</tbody>
				</c:forEach>
			</table>
		</div>
	</div>
</div>