angular
  .module('app')
  .config [
    '$stateProvider'
    '$urlRouterProvider'
    ($stateProvider, $urlRouterProvider) ->

      $stateProvider
        .state 'inside.request',
          url: '/request'
          templateUrl : 'templates/inside/request.html'
          controller  : 'RequestCtrl'

      return
  ]
