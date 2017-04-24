angular
  .module('app')
  .config [
    '$stateProvider'
    ( $stateProvider ) ->

      $stateProvider
        .state 'inside.logout',
          url        : '/logout'
          controller : [
            '$user'
            '$state'
            ( $user, $state )->
              
              $user.delete()
              $state.go 'outside.login'

          ]

      return
  ]
