function farmerSignupCtl($scope, $http){

  $scope.user_errors = ""

  $scope.submitAllFormsInOrder = function(){
    $scope.createUser();
  }

  $scope.createUser = function(){
    $http.post('/users', {"user": $scope.user, "ajax": true }).
    success( function(response){
      if( response.id ){
        $scope.user_errors = ""
        $scope.createFarmer(response.id);
      }
      else{
        alert(response);
        $scope.user_errors = JSON.stringify(response)
        //put the erros on the first page
        alert(JSON.stringify(response));
      }
    }).
    error( function(response){
      alert("error fag");
    });
  }

  $scope.createFarmer = function(userId){
    $http.post('/farmers', {"farmer": $scope.farmer, "ajax": true, "user_id": userId }).
    success( function(response){
      if( response.id ){
        $scope.createFarm(response.id);
      }
      else
        $scope.farmer_errors = JSON.stringify(response)
        alert("failed hard! " + JSON.stringify(response))
    }).
    error( function(response){
      alert("error fag");
    });
  }

  $scope.createFarm = function(farmerId){
    $scope.farm["farmer_id"] = farmerId;
    $http.post('/farms', {"farm": $scope.farm, "ajax": true }).
    success( function(response){
      if( response.id ){
        alert("success! " + JSON.stringify(response))
        $scope.createProducts(response.id);
      }
      else
        $scope.farm_errors = JSON.stringify(response)
        alert("failed hard! " + JSON.stringify(response))
    }).
    error( function(response){
      alert("error fag");
    });
  }

  $scope.createProducts = function(farmId){
    $scope.product["farm_id"] = farmId;
    $http.post('/products', {"product": $scope.product, "ajax": true }).
    success( function(response){
      if( response.id ){
        alert("success! " + JSON.stringify(response));
        alert("everything seems to have worked!!");
      }
      else
        $scope.product_errors = JSON.stringify(response)
        alert("failed hard! " + JSON.stringify(response))
    }).
    error( function(response){
      alert("error fag");
    });
  }
}

