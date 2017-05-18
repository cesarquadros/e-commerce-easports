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
<!-- <script src="./js/jquery-3.1.1.min.js"></script> -->
<script src="./js/bootstrap.min.js"></script>
<script src="./js/bootstrap.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script
	src=https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.6.1/angular.min.js></script>
<script src="./controller/controllerProduto.js"></script>

<title>EA Sports</title>


</head>

<body ng-app="app" ng-controller="appCtrl">

	<div class="container-fluid" id="banner1">
		<div class="row">
			<div class="col-xs-4 col-sm-4 col-md-4">
				<a href="index.jsp"><img
					src="./imagens_projeto/logo2.png" alt="Logotipo" id="logo"
					class="img-responsive" /> </a>
			</div>
			
			<div class="col-xs-4 col-sm-4 col-md-8">
				<ul class="nav navbar-nav navbar-right">
				
					<li class="dropdown">
						<a class="dropdown-toggle"	data-toggle="dropdown" href="#">
							<span class="glyphicon glyphicon-user" ng-init="verificarLogin('${usuarioLogado.nome}')"></span> 
					{{logado ? '${usuarioLogado.nome}' : 'Entrar' }}<span class="caret"></span></a>
						<ul class="dropdown-menu">						
							<li><a href="{{logado ? 'minhaconta.jsp' : 'login.jsp' }}">{{logado ? 'Minha conta' : 'Efetuar Login'}}</a></li>
							<li><a href="/e-commerce-easports/CarrinhoServlet?acao=carrinhobycli">Meu Carrinho</a></li>
							<li><a href="/e-commerce-easports/ClienteServlet?acao=logout">Sair</a></li>
						</ul></li>
				
					<li>
						<a href="/e-commerce-easports/CarrinhoServlet?acao=carrinhobycli">
							<span class="glyphicon glyphicon-shopping-cart">
							</span> Carrinho <span style="color: green;">(${fnc:length(usuarioLogado.listaItens)}) </span>
						</a>
					</li>	
				</ul>
			</div>
		</div>
	</div>

	<div class="navbar navbar-default navbar-static-top">
		<button class="navbar-toggle" data-toggle="collapse"
			data-target=".navHeaderCollapse">
			<span class="icon-bar"></span> 
			<span class="icon-bar"></span> 
			<span class="icon-bar"></span>
		</button>

		<div class="collapse navbar-collapse navHeaderCollapse" id="divMenu">
			<div class="container center">
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