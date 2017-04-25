angular
  .module( 'app' )
  .service '$requ', [
    '$http'
    'baseUrl'
    ( $http, url ) ->
      {
        update : ( request ) -> $http.put url + '/request', angular.toJson( request )
      }
  ]