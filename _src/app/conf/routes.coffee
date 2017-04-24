angular
  .module('app')
  .config [
    '$stateProvider'
    '$urlRouterProvider'
    ($stateProvider, $urlRouterProvider) ->

      $urlRouterProvider.otherwise '/login'

      return
  ]
