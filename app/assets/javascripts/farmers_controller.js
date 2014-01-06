function farmerSignupCtl($scope, $http, $location){

  $scope.user_errors = ""
  $scope.farmer_errors = ""

  $scope.user    = { "name":"", "email":"", "password":"", "password_confirmation":""};
  $scope.farmer  = {"favorite_quotes":"", "role_models":"", "personal_philosophy":""};

  $scope.submitForms = function(){
    alert("submitting...");
    //alert(JSON.stringify($scope["user"]));
    //submitUserData();
    submitData("user");
  }

  submitData = function(model, id){
    alert("the model is " + model);
    alert("and the model info is " + JSON.stringify($scope[model]));

    var modelToSubmit = {"ajax":true};
    modelToSubmit[model] = $scope[model]
    var path = '/' + model + 's';
    if(model === "farmer"){
      modelToSubmit["user_id"] = id;
    }

    alert("posting " + JSON.stringify(modelToSubmit) +  " to " + path);

    $http.post(path, modelToSubmit).
    success( function(response){
      if( response.id ){
        alert("Hey a success, the response was " + JSON.stringify(response));
        //$scope.user_errors = "No errors!";
        //$scope.user_id = response.id;
        if(model === "user"){
          submitData("farmer", response.id)
        }
        else{
          window.location.href = "http://localhost:3000/farms/new";
        }
      }
      else{
        alert(response);
        $scope.user_errors = JSON.stringify(response)
        alert(JSON.stringify(response));
      }
    }).
    error( function(response){
      alert('bad mkay'); 
    }); 
  }

  //submitUserData = function(){
    //$http.post('/users', {"user": $scope.user, "ajax": true }).
    //success( function(response){
      //if( response.id ){
        //$scope.user_errors = "No errors!";
        //$scope.user_id = response.id;
        //submitFarmerData($scope.user_id);
      //}
      //else{
        //alert(response);
        //$scope.user_errors = JSON.stringify(response)
        //alert(JSON.stringify(response));
      //}
    //}).
    //error( function(response){
      //alert("error fag");
    //});
  //}

  //submitFarmerData = function(userId){
    //$http.post('/farmers', {"farmer": $scope.farmer, "ajax": true, "user_id": userId }).
    //success( function(response){
      //if( response.id ){
        //$scope.farmer_errors = "No errors!";
        //alert(window.location.href);
        ////$location.path("/farmers/" + response.id + "" );
      //}
      //else{
        //$scope.farmer_errors = JSON.stringify(response)
      //}
    //}).
    //error( function(response){
      //alert("error fag");
    //});
  //}

}

