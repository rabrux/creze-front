angular
  .module( 'app' ) 
  .controller 'RequestCtrl', [
    '$scope'
    '$requ'
    'applications'
    ( $scope, $req, apps ) ->

      $scope.status = 'NONE'
      $scope.applications = apps.data

      $scope.changeStatus = ( application, status ) ->
        swal({
          title: 'Advertencia'
          text: "¿Realmente desea cambiar el estado de la solicitud #{ application.id }?"
          type: 'warning'
          showCancelButton: true
          showConfirmButton: true
          confirmButtonText: 'Si'
          cancelButtonText: 'No'
          closeOnConfirm: true
          allowEscapeKey: false
        }, (isConfirm) ->
          if isConfirm
            $req.update id : application.id, status : status
              .success ( response ) ->
                application.status = status
              .error ( response ) ->
                swal '¡Error!', 'La operación no ha podido completarse correctamente. Favor de intentar más tarde.', 'error'
        )

  ]