var app = angular.module('app', []);
app.controller('appCtrl', [ '$scope', '$http', function($scope, $http) {
	$scope.array;
	$scope.senha;
	$scope.corfirmSenha;
	$scope.result = false;

	$scope.validaCep = function(cep) {

		$http({
			method : 'post',
			url : 'EnderecoServlet',
			data : cep
		}).then(function(retorno) {
			$scope.array = (retorno.data.endereco);

			if ($scope.array == null) {

				alert('OPS! CEP Nao encontrado');
			}

			// alert($scope.array.logradouro);
		});
	}
	$scope.validarSenha = function() {

		$scope.result = angular.equals($scope.senha, $scope.corfirmSenha);

		if (!$scope.result) {
			$scope.corfirmSenha = "";
			$scope.result = true;
		} else {
			$scope.result = false;
		}
	}

	$scope.excluirItem = function(idItem, acao) {
		$http({
			method : 'post',
			url : 'CarrinhoServlet',
			data : [ idItem, acao ]
		}).then(function(retorno) {
			alert('Removido do carrinho');
			setTimeout('location.reload();', 1);
		});
	}

	$scope.parcelar = function(valor, parcela) {
		return (valor / parcela);
	}

	$scope.hideCard = function(cartao) {
		if (cartao) {
			return true;
		} else {
			return false;
		}
	}

	$scope.showCard = function(cartao) {
		if (cartao) {
			return false;
		} else {
			return true;
		}
	}

	$scope.addCarrinho = function(idProduto, acao, qtdSolicitada, qtdEstoque) {
		
		if(qtdSolicitada+1 > qtdEstoque ){
			alert('OPS! Quantidade indisponivel');
		} else {
			$http({
				method : 'post',
				url : 'CarrinhoServlet',
				data : [ idProduto, acao ]
			}).then(function(retorno) {

				if (retorno.data) {
					alert('Adicionado ao carrinho');
					setTimeout('location.reload();', 1);
				} else {
					alert('OPS! Ocorreu um erro');
				}
			});
		}

	}
} ]);