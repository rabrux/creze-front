angular
  .module('app')
  .config [
    '$stateProvider'
    ( $stateProvider ) ->

      $stateProvider
        .state 'inside',
          templateUrl : 'templates/inside/index.html'
          controller  : 'RootCtrl'
          resolve :
            user : [
              '$q'
              '$user'
              ( $q, $user ) ->
                user = $user.get()
                return $q.reject 'FORBIDDEN' if not user
                user
            ]

      return
  ]
