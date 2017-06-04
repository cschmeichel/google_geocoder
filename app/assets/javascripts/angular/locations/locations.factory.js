angular.module('googleGeocoder')
  .factory('LocationsFactory', LocationsFactory);

LocationsFactory.$inject = ['$resource'];
function LocationsFactory($resource) {
  return $resource('/api/locations/:id.json', { id: '@id' });
}
