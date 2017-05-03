/**
 * 
 */


var app = angular.module('app', []);
app.controller('appCtrl', [ '$scope', '$http', function($scope, $http) {
	$scope.array;

	$scope.validaCep = function() {
		
		var cep = $scope.cCep;
		$http({
			method : 'post',
			url : 'ClienteServlet',
			data : {'cep': cep}
		}).then(function(retorno) {
			$scope.array = (retorno.data.endereco);
            //alert(retorno.data);
		});
	}
} ]);