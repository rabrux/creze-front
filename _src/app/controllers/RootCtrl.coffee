angular
  .module( 'app' )
  .controller 'RootCtrl', [
    '$scope'
    'user'
    ( $scope, user ) ->

      $scope.user = user

      $scope.search = ''
  ]