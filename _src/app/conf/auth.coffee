angular
  .module( 'app' )
  .config [
    'authProvider'
    (authProvider) ->
      authProvider.init
        url : 'http://localhost:1337'
  ]