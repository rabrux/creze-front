angular
  .module('app')
  .config [
    '$stateProvider'
    ( $stateProvider ) ->

      $stateProvider
        .state 'inside.request',
          url: '/request'
          templateUrl : 'templates/inside/request.html'
          controller  : 'RequestCtrl'

      return
  ]
