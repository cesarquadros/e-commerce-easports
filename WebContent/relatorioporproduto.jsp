<jsp:include page="cabecalhobackoffice.jsp"></jsp:include>
<jsp:include page="menubackoffice.jsp"></jsp:include>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fnc"%>
<jsp:useBean
	class="br.com.ecommerceeasports.managedbean.ManagedBeanRelatorioVendaProduto"
	id="mb"></jsp:useBean>


<div class="container">
	<div class="row">
		<div class="col-xs-12 col-sm-12 col-md-12">
			<h1 class="center">Relatório de vendas por produto</h1>
			<br /> 

			<br />
			<table class="table table-hover">
				<thead>
					<tr style="background: #eee;">
						<th>Produto</th>
						<th>Quantidade vendida</th>
						<th>Valor unitário</th>
						<th>Talor total</th>
					</tr>
				</thead>
				<c:forEach items="${mb.listagemCategorias}" var="c">
					<tbody>
						<tr>
							<td>${c.produto.nome}</td>
							<td>${c.quantidade}</td>
							<td>${c.produto.valorVendaFormatado}</td>
							<td>${c.valorFormatado}</td>
						</tr>
					</tbody>
				</c:forEach>
				<c:remove scope="session" var="listacompras" />
			</table>
		</div>
	</div>
</div>