angular
  .module( 'app' ) 
  .controller 'RequestCtrl', [
    '$scope'
    ( $scope ) ->

      $scope.status = 'NONE'
      $scope.applications = [
        {
          id   : '0689'
          date : 1492827952704
          person : 'Lorem Ipsum'
          amount : 50000
          status : 'RECEIVED'
          monthlySales : 5000
        }
        {
          id   : '0689'
          date : 1492827952704
          person : 'Lorem Ipsum'
          amount : 50000
          status : 'APPROVED'
          monthlySales : 350260
        }
        {
          id   : '0689'
          date : 1492827952704
          person : 'Lorem Ipsum'
          amount : 50000
          status : 'VERIFIED'
          monthlySales : 750000
        }
        {
          id   : '0689'
          date : 1492827952704
          person : 'Lorem Ipsum'
          amount : 50000
          status : 'RECEIVED'
          monthlySales : 250000
        }
        {
          id   : '0689'
          date : 1492827952704
          person : 'Lorem Ipsum'
          amount : 50000
          status : 'VERIFIED'
          monthlySales : 850000
        }
        {
          id   : '0689'
          date : 1492827952704
          person : 'Lorem Ipsum'
          amount : 50000
          status : 'RECEIVED'
          monthlySales : 250000
        }
        {
          id   : '0689'
          date : 1492827952704
          person : 'Lorem Ipsum'
          amount : 50000
          status : 'RECEIVED'
          monthlySales : 250000
        }
        {
          id   : '0689'
          date : 1492827952704
          person : 'Lorem Ipsum'
          amount : 50000
          status : 'RECEIVED'
          monthlySales : 50000
        }
        {
          id   : '0689'
          date : 1492827952704
          person : 'Lorem Ipsum'
          amount : 50000
          status : 'CLIENT-ACCEPTED'
          monthlySales : 300000
        }
        {
          id   : '0689'
          date : 1492827952704
          person : 'Lorem Ipsum'
          amount : 50000
          status : 'REJECTED'
          monthlySales : 500000
        }
        {
          id   : '0689'
          date : 1492827952704
          person : 'Lorem Ipsum'
          amount : 50000
          status : 'RECEIVED'
          monthlySales : 500000
        }
        {
          id   : '0689'
          date : 1492827952704
          person : 'Lorem Ipsum'
          amount : 50000
          status : 'APPROVED'
          monthlySales : 350000
        }
      ]
  ]

    
