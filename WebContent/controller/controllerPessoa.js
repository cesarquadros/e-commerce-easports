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

	$scope.verificarLogin = function(usuario) {
		if (usuario) {
			$scope.logado = true;
		}
	}
	
	$scope.validaCpf = function(cpf) {

		if (cpf != '') {
			$http({
				method : 'post',
				url : 'ValidaCpf',
				data : cpf
			}).then(function(retorno) {
				if (retorno.data != "") {
					alert('OPS! CPF ja cadastrado para outro cliente');
					$scope.cCpf = '';
				}
			});
		}
	}

	$scope.validaEmail = function(email) {

		if (email != '') {
			$http({
				method : 'post',
				url : 'ValidaEmail',
				data : email
			}).then(function(retorno) {
				if (retorno.data != "") {
					alert('OPS! Email ja cadastrado para outro cliente');
					$scope.cEmail = '';
				}
			});
		}
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

} ]);