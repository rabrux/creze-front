angular
  .module( 'app' )
  .filter 'amount', [
    '$filter'
    ( $filter ) ->
      return ( amount ) ->
        return $filter('currency')( amount ) if amount < 1000

        return $filter('currency')( amount / 1000 ) + 'K' if amount < 1000000

        return $filter('currency')( amount / 1000000 ) + 'M'
  ]