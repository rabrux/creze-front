angular
  .module( 'app' )
  .controller 'VerifyCtrl', [
    '$scope'
    '$stateParams'
    '$auth'
    ( $scope, $params, $auth ) ->

      $auth.verify $params.hash
        .success ( response ) ->
          $scope.msg = response
        .error ( response ) ->
          $scope.msg = response

  ]