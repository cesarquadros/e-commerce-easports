
var app = angular.module('app', []);
app.controller('appCtrl', [ '$scope', '$http', function($scope, $http) {
	$scope.array;
	$scope.logado = false;

	$scope.listAll = function() {
		$http({
			method : 'post',
			url : 'CarregarProdutosServlet',
			data : {
				produto : $scope.texto
			}
		}).then(function(retorno) {
			$scope.array = (retorno.data.produtos);
			// alert(retorno.data);
		});
	}

	$scope.addCarrinho = function(idProduto,acao) {
		$http({
			method : 'post',
			url : 'CarrinhoServlet',
			data : [idProduto, acao]
		}).then(function(retorno) {
			
			if(retorno.data){
				alert('Adicionado ao carrinho');
				setTimeout('location.reload();', 1);
			} else {
				alert('OPS! Ocorreu um erro');
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
			data : [idItem,acao]
		}).then(function(retorno) {
			if(retorno.data){
				alert('Removido do carrinho');
				setTimeout('location.reload();', 1);
			} else {
				alert('OPS! Ocorreu um erro');
			}
			
		});
	}

} ]);
