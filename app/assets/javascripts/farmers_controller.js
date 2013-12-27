function farmerSignupCtl($scope, $http){

  $scope.user_errors = ""

  $scope.user    = {};
  $scope.farmer  = {};
  $scope.farm    = {};
  $scope.product = {};


  $scope.current_page = 1;

  $scope.submitAllFormsInOrder = function(){
    $scope.createUser();
  }
  
  $scope.decreasePage = function(){
    $scope.current_page -= 1;
  }

  $scope.increasePage = function(){
    if($scope.current_page == 1){
      alert("submitting user data");
      alert("submitting farmer data");
      submitUserData();
    }
    if($scope.current_page == 2){
      alert("submitting farm data");
      submitFarmData($scope.farmer_id);
    }
    if($scope.current_page == 3){
      alert("submitting product data");
      submitProductData($scope.farm_id);
    }

    $scope.current_page += 1;
  }

  submitUserData = function(){
    $http.post('/users', {"user": $scope.user, "ajax": true }).
    success( function(response){
      if( response.id ){
        alert("the user id is " + response.id);
        $scope.user_errors = "No errors!";
        $scope.user_id = response.id;
        submitFarmerData($scope.user_id);
      }
      else{
        alert(response);
        $scope.user_errors = JSON.stringify(response)
        alert(JSON.stringify(response));
      }
    }).
    error( function(response){
      alert("error fag");
    });
  }

  submitFarmerData = function(userId){
    $http.post('/farmers', {"farmer": $scope.farmer, "ajax": true, "user_id": userId }).
    success( function(response){
      if( response.id ){

        $scope.farmer_errors = "No errors!";
        $scope.farmer_id = response.id;
      }
      else{
        $scope.farmer_errors = JSON.stringify(response)
        alert("failed hard! " + JSON.stringify(response))
      }
    }).
    error( function(response){
      alert("error fag");
    });
  }

  submitFarmData = function(farmerId){
    $scope.farm["farmer_id"] = farmerId;
    $http.post('/farms', {"farm": $scope.farm, "ajax": true }).
    success( function(response){
      if( response.id ){
        $scope.farm_errors = "No errors!";
        $scope.farm_id = response.id;
      }
      else
        $scope.farm_errors = JSON.stringify(response)
        alert("failed hard! " + JSON.stringify(response))
    }).
    error( function(response){
      alert("error fag");
    });
  }

  submitProductData = function(farmId){
    $scope.product["farm_id"] = farmId;
    $http.post('/products', {"product": $scope.product, "ajax": true }).
    success( function(response){
      if( response.id ){
        $scope.product_errors = "No errors!";
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

