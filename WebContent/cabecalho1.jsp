<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fnc"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link rel="stylesheet" href="./css/imagens.css" />
<link rel="stylesheet" href="./css/normalize.min.css" />
<link rel="stylesheet" href="./css/font-awesome.css" />
<link rel="stylesheet" href="./css/font-awesome.min.css" />
<link rel="stylesheet" href="./css/bootstrap.min.css" />
<link rel="stylesheet" href="./css/bootstrap-theme.min.css" />
<link rel="stylesheet" href="./css/bootstrap-social.css" />
<link rel="stylesheet" href="./css/font-awesome.css" />
<link rel="stylesheet" href="./css/font-awesome.min.css" />
<link rel="stylesheet" href="./css/bootstrap-social.less" />
<link rel="stylesheet" href="./css/bootstrap-social.scss" />
<link rel="stylesheet" href="./css/estiloHome.css" />
<script src="./js/jquery-3.1.1.min.js"></script>
<script src="./js/bootstrap.min.js"></script>
<script src="./js/bootstrap.js"></script>	

<title>EA Sports</title>
</head>
<body>

		<div class="container" id="banner1">
		<div class="row">
			<div class="col-xs-5 col-sm-5 col-md-2">
				<a href="index.jsp"><img
					src="https://upload.wikimedia.org/wikipedia/en/c/c4/EA_Sports_logo.png"
					alt="Logotipo" id="logo" class="img-responsive" />
				</a>
			</div>

			<div class="col-xs-5 col-sm-5 col-md-6" id="buscarDoBanner">
				<input class="form-control input-lg" type="text"
					placeholder="Buscar">
			</div>

			<div class="col-xs-2 col-sm-2 col-md-1">
				<div class="glyphicon glyphicon-search" id="iconeBuscar"></div>
			</div>

			<div class="col-xs-6 col-sm-2 col-md-3">
				<div class="row">
					<a href="login.jsp">
					<div class="col-xs-6 col-sm-6 col-md-6">
						<div class="glyphicon glyphicon-user" id="iconeUsuario"></div>
						Minha Conta
					</div></a>

					<a href="carrinho.jsp"><div class="col-xs-6 col-sm-6 col-md-6">
						<div class="glyphicon glyphicon-shopping-cart" id="iconeCarrinho"></div>
						Meu Carrinho
					</div></a>
				</div>
			</div>
		</div>
	</div>

	<div class="navbar navbar-default navbar-static-top">

		<button class="navbar-toggle" data-toggle="collapse"
			data-target=".navHeaderCollapse">
			<span class="icon-bar"></span> <span class="icon-bar"></span> <span
				class="icon-bar"></span>
		</button>

		<div class="collapse navbar-collapse navHeaderCollapse" id="divMenu">
			<div class="container">
				<ul class="nav navbar-nav navbar-left">
					<li><a href="produtocategoria.jsp">Natação</a></li>
					<li><a href="#">Tênis</a></li>
					<li><a href="#">Surf</a></li>
					<li><a href="#">Snow Board</a></li>
					<li><a href="#">Basquete</a></li>
					<li><a href="#">Vôlei</a></li>
					<li><a href="#">Escalada</a></li>
					<li><a href="#">Jogos de Mesa</a></li>
					<li><a href="#">Suplementos</a></li>
				</ul>
			</div>
		</div>
	</div>


</body>
</html>