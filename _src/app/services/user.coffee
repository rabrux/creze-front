angular
  .module( 'app' )
  .service '$user', [
    '$localStorage'
    ( $db ) ->
      {
        set    : ( user ) -> $db.set 'user', user
        get    : -> $db.get 'user'
        delete : -> $db.delete 'user'
      }
  ]