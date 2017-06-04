angular.module('googleGeocoder')
	.controller('LocationsController', LocationsController);

LocationsController.$inject = ['$scope', 'LocationsFactory'];
function LocationsController($scope, LocationsFactory) {

	$scope.locations = LocationsFactory.query();

	$scope.geolocateAddress = function() {
    if (!valid()) {
			$scope.error_message = 'Error: Address is empty';
     	return false;
  	}

		LocationsFactory.save($scope.location,
			function(response, _headers) {
				$scope.locations.push(response);
			},
			function(response) {
				$scope.error_message = response.data.errors;
			}
		);

		$scope.error_message = '';
  };

	valid = function() {
		return !!$scope.location && !!$scope.location.address
	}
}
