angular
  .module( 'app' )
  .service '$sendReq', [
    '$http'
    'baseUrl'
    ( $http, url ) ->
      {
        send : ( request ) -> $http.post url + '/send-request', angular.toJson( request )
      }
  ]