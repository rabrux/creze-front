angular
  .module( 'app' )
  .controller 'SendRequestCtrl', [
    '$scope'
    '$sendReq'
    ( $scope, $req ) ->

      # dummie data
      $scope.request =
        name : 'Lorem Ipsum'
        email : 'lorem@gmail.com'
        monthlySales : 50000
        amount : 50000

      $scope.send = ->
        $req.send $scope.request
          .success ( response ) ->
            swal '¡Éxito!', 'Hemos recivido tu solicitud, nosotros nos pondremos en contacto contigo para darle seguimiento a tu proceso.', 'success'
            $scope.request =
              name : ''
              email : ''
              monthlySales : undefined
              amount : undefined
          .error ( response ) ->
            console.error response
  ]