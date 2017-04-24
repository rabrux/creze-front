angular.module( 'app', [ 'ui.router', 'auth' ] )
  .run [
    '$rootScope'
    '$state'
    ( $rootScope, $state ) ->
      $rootScope.$on '$stateChangeError', ( e, toState, toParams, fromState, fromParams, error ) ->
        if error == 'FORBIDDEN'
          $state.go 'outside.login'
        console.error 'RESOLVE_ERROR', error
  ]
