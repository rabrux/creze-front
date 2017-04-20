angular
  .module('app')
  .config [
    '$stateProvider'
    '$urlRouterProvider'
    ($stateProvider, $urlRouterProvider) ->

      $stateProvider
        .state 'outside.login',
          url: '/login'
          templateUrl: 'templates/outside/login.html'
          # controller: 'LoginCtrl'

      return
  ]
