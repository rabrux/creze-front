angular
  .module('app')
  .config [
    '$stateProvider'
    ( $stateProvider ) ->

      $stateProvider
        .state 'outside',
          templateUrl : 'templates/outside/index.html'

      return
  ]