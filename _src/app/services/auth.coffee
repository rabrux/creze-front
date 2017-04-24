angular
  .module( 'app' )
  .service '$auth', [
    '$http'
    'baseUrl'
    ( $http, url ) ->
      {
        login    : ( credentials ) -> $http.post url + '/signin', angular.toJson( credentials )
        recovery : ( user ) -> $http.put url + '/recovery', angular.toJson( user )
        passwd   : ( data ) -> $http.put url + '/passwd', angular.toJson( data )
        verify   : ( key ) -> $http.get url + '/verify/' + key
      }
  ]