angular
  .module( 'app' )
  .config [
    '$stateProvider'
    ( $stateProvider ) ->
      
      $stateProvider
        .state 'outside.verify',
          url         : '/verify/:hash'
          templateUrl : 'templates/outside/verify.html'
          controller  : 'VerifyCtrl'

  ]
