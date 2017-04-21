angular
  .module('app')
  .config [
    '$stateProvider'
    '$urlRouterProvider'
    ($stateProvider, $urlRouterProvider) ->

      $stateProvider
        .state 'outside',
          templateUrl : 'templates/outside/index.html'

      return
  ]