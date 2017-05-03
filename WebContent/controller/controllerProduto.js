/**
 * 
 */

var app = angular.module('app', []);
app.controller('appCtrl', [ '$scope', '$http', function($scope, $http) {
	$scope.array;

	$scope.listAll = function() {
		$http({
			method : 'post',
			url : 'ComprarProdutoServlet',
			data : {
				produto : $scope.pesquisaprod
			}
		}).then(function(retorno) {
			$scope.array = (retorno.data.produtos);
            //alert(retorno.data);
		});
	}

} ]);
