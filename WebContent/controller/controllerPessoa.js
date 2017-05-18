
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
			
			if($scope.array == null){

				alert('OPS! CEP Nao encontrado');
			}
			
            //alert($scope.array.logradouro);
		});
	}
	
	$scope.verificarLogin = function(usuario) {
		if (usuario) {
			$scope.logado = true;
		}
	}
	
} ]);