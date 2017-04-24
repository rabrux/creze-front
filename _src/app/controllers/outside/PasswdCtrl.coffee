angular
  .module( 'app' )
  .controller 'PasswdCtrl', [
    '$scope'
    '$stateParams'
    '$auth'
    ( $scope, $params, $auth ) ->

      $scope.send = ->
        data =
          key      : $params.hash
          password : $scope.password
        
        $auth.passwd data
          .success ( response ) ->
            $scope.msg = response
          .error ( response ) ->
            switch response
              when 'Not Found'
                ralert 'error', 'No se puede complatar la operación, ¿Realmente ha iniciado el proceso de cambio de contraseña?'
              else
                console.error 'response', response

  ]