angular
  .module('app')
  .config [
    '$stateProvider'
    '$urlRouterProvider'
    ($stateProvider, $urlRouterProvider) ->

      $stateProvider
        .state 'outside',
          template: '<div ui-view>'

      return
  ]