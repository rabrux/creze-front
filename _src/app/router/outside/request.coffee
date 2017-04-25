angular
  .module('app')
  .config [
    '$stateProvider'
    ( $stateProvider ) ->

      $stateProvider
        .state 'outside.request',
          url         : '/send-request'
          templateUrl : 'templates/outside/request.html'
          controller  : 'SendRequestCtrl'

      return
  ]
