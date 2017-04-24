angular
  .module( 'app' )
  .controller 'RecoveryCtrl', [
    '$scope'
    '$auth'
    ( $scope, $auth ) ->

      $scope.send = ->
        $auth.recovery $scope.user
          .success ( response ) ->
            $scope.msg = response
          .error ( response ) ->
            switch response
              when 'Unauthorized'
                ralert 'error', 'El servicio le ha sido negado, por favor contacte a un administrador para revisar el estado de su cuenta.'
              when 'Not Found'
                ralert 'error', 'El correo electrónico proporcionado no pertenece a ningun usuario.'
              when 'EMAIL_NOT_VALIDATED'
                ralert 'warning', 'El correo electrónico no ha sido verificado, por favor revise su bandeja de entrada.'
              when 'INVALID_EMAIL_ADDRESS'
                ralert 'info', 'La dirección de correo electrónico es incorrecta.'
              else
                console.error 'response', response
              
            


  ]