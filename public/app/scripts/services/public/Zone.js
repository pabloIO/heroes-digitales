(function(){
	'use strict';
	angular.module('heroesDigitalesApp')
		.factory('Zone', Zone)
		.constant('PUBLIC_URL', 'http://localhost:8000/api/v1/');
	Zone.$inyect = ['$http', 'PUBLIC_URL'];
	function Zone($http, PUBLIC_URL){
		return{
			getZones: function(){
				var promise = $http({
					method: 'GET',
					url: PUBLIC_URL + 'zones'
				}).then(function(response){
					return response.data;	
				});
				return promise;
			},
		};
	};
})();