/**
 * 
 */

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
            //alert(retorno.data);
		});
	}
	
	$scope.addCarrinho = function() {
		alert('Adicionado ao carrinho');
	}
	
	
	$scope.verificarLogin = function (usuario) {
		if(usuario){
			$scope.logado = true;
		}
	}
	
} ]);
