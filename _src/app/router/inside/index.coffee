angular
  .module('app')
  .config [
    '$stateProvider'
    ( $stateProvider ) ->

      $stateProvider
        .state 'inside',
          templateUrl : 'templates/inside/index.html'
          controller  : 'RootCtrl'

      return
  ]
