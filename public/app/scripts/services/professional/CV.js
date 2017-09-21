(function(){
	'use strict';
	angular.module('heroesDigitalesApp')
		.factory('CV', CV);
	CV.$inyect = ['$http', 'PUBLIC_URL', 'AUTH_URL', 'Auth'];
	function CV($http, PUBLIC_URL, AUTH_URL, Auth){
		return{
			getCV: function(name){
				var promise = $http({
					method: 'GET',
					url: AUTH_URL + 'cv/'+name,
					params: {token: Auth.getSession().token }
				}).then(function(response){
					return response.data;	
				});
				return promise;
			},
		};
	};
})();