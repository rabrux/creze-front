angular
  .module( 'app' )
  .controller 'LoginCtrl', [
    '$scope'
    '$state'
    '$auth'
    '$user'
    ( $scope, $state, $auth, $user ) ->
      
      # login action
      $scope.login = ->

        $auth.login $scope.credentials
          .success ( response ) ->
            $user.set response
            $state.go 'inside.request'
          .error ( response ) ->
            switch response
              when 'INVALID_CREDENTIALS'
                ralert 'warning', 'El usuario y/o la contraseña proporcionados son incorrectos.'
              when 'EMAIL_NOT_VALIDATED'
                ralert 'warning', 'El correo electrónico no ha sido verificado, por favor revise su bandeja de entrada.'
              else
                console.error 'error', response


  ]