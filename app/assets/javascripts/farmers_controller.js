function farmerSignupCtl($scope, $http){

  $scope.submitFarmerSignup = function(){

    $http.post('/users', $scope.user).
    success( function(response){
      if(response.id)
        alert("success! " + JSON.stringify(response))
      else
        alert("failed hard! " + JSON.stringify(response))
    }).
    error( function(response){
    });
  }
}

