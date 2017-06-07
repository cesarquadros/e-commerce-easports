var app = angular.module('app', []);
app.controller('appCtrl', [ '$scope', '$http', function($scope, $http) {
	$scope.array;
	$scope.logado = false;

	$scope.listAllestoque = function() {
		$http({
			method : 'post',
			url : 'CarregarProdutosEstoque',
			data : {
				produto : $scope.texto
			}
		}).then(function(retorno) {
			$scope.array = (retorno.data.produtos);
		});
	}

	$scope.listAll = function() {
		$http({
			method : 'post',
			url : 'CarregarProdutosServlet',
			data : {
				produto : $scope.texto
			}
		}).then(function(retorno) {
			$scope.array = (retorno.data.produtos);

		});
	}

	$scope.addCarrinho = function(idProduto, acao) {
		$scope.ok = 'OK';
		$http({
			method : 'post',
			url : 'CarrinhoServlet',
			data : [ idProduto, acao ]
		}).then(function(retorno) {

			if (retorno.data.carrinho) {
				alert('Adicionado ao carrinho');
				setTimeout('location.reload();', 1);
			} else {
				alert('Por favor efetuar o login');
			}

		});
	}
	$scope.verificarLogin = function(usuario) {
		if (usuario) {
			$scope.logado = true;
		}
	}

	$scope.excluirItem = function(idItem, acao) {
		$http({
			method : 'post',
			url : 'CarrinhoServlet',
			data : [ idItem, acao ]
		}).then(function(retorno) {
			if (retorno.data) {
				alert('Removido do carrinho');
				setTimeout('location.reload();', 1);
			} else {
				alert('OPS! Ocorreu um erro');
			}
		});
	}
} ]);
