(function(){
	'use strict';

	angular.module('heroesDigitalesApp')
		.controller('ParentsAuthCtrl', ParentsAuthCtrl);
	ParentsAuthCtrl.$inyect = ['$state', 'User', 'Auth'];

	function ParentsAuthCtrl($state, User, Auth){
		var vm = this;
		// Props
		vm.userCreds = Auth.getSession();
		vm.parents = {
			signature: ''
		}
		// Methods
		vm.accept = accept;
		// Methods implementation
		function accept(){
			User.acceptParentsAuth({uid: vm.userCreds.id, signature: vm.parents.signature}).then(function(data){
				if(data.success)
					$state.go('user');
				else
					alert(data.msg);
			}, function(err){
				console.error('Hubo un error en el servidor');
			});
		}
	};
})();