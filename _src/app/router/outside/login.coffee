angular
  .module('app')
  .config [
    '$stateProvider'
    ( $stateProvider ) ->

      $stateProvider
        .state 'outside.login',
          url         : '/login'
          templateUrl : 'templates/outside/login.html'
          controller  : 'LoginCtrl'

      return
  ]
