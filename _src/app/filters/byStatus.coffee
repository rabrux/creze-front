angular
  .module( 'app' )
  .filter 'byStatus', [ ->
    return ( applications, status ) ->
      return applications if status is 'NONE'

      switch status
        when 'LT300', 'REJECTED'
          return applications.filter ( it, index ) ->
            return it if it.monthlySales < 300000
            return it if it.status is status
        else
          return applications.filter ( it, index ) ->
            return it if it.status is status
  ]