angular
  .module( 'app' )
  .config [
    '$stateProvider'
    ( $stateProvider ) ->
      
      $stateProvider
        .state 'outside.recovery',
          url         : '/recovery'
          templateUrl : 'templates/outside/recovery.html'

  ]
