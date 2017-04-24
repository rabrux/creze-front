angular
  .module( 'app' )
  .config [
    '$stateProvider'
    ( $stateProvider ) ->
      
      $stateProvider
        .state 'outside.passwd',
          url         : '/passwd/:hash'
          templateUrl : 'templates/outside/passwd.html'
          controller  : [
            '$scope'
            ( $scope ) ->
              console.log 'hello from passwd'
          ]

  ]
