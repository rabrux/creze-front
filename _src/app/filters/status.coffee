angular
  .module( 'app' )
  .filter 'status', [ ->
    return ( application ) ->
      return 'ion-android-warning' if not application?.monthlySales
      return 'ion-arrow-graph-down-right rejected' if parseInt( application.monthlySales ) < 300000

      switch application.status
        when 'RECEIVED'
          return 'ion-android-done'
        when 'APPROVED'
          return 'ion-android-done-all approved'
        when 'VERIFIED'
          return 'ion-android-done-all verified'
        when 'CLIENT-ACCEPTED'
          return 'ion-ios-person-outline approved'
        when 'REJECTED'
          return 'ion-android-close rejected'
  ]