angular
  .module( 'app' )
  .controller 'RootCtrl', [
    '$scope'
    ( $scope ) ->
      $scope.search = ''
  ]