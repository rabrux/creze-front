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
          resolve :
            applications : [
              '$http'
              'baseUrl'
              ( $http, url ) ->
                $http.get url + '/request'
            ]

      return
  ]
