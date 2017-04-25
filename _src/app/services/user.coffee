angular
  .module( 'app' )
  .service '$user', [
    '$localStorage'
    ( $db ) ->
      {
        set    : ( user ) ->
          $db.set 'user', user
          $db.set 'token', user.token
        get    : -> $db.get 'user'
        delete : ->
          $db.delete 'user'
          $db.delete 'token'
      }
  ]