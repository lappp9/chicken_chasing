//= require angular/angular
//= require angular-resource/angular-resource


var app = angular.module('CheckOut', ['ngResource']);

app.config(['$httpProvider', function($httpProvider){
 $httpProvider.defaults.headers.common['X-CSRF-TOKEN'] = $('meta[name=csrf-token]').attr('content');
 $httpProvider.defaults.headers.common['X-Requested-With'] = 'XMLHttpRequest';
}]);


app.controller('CheckoutCtrl', ['$scope', 'CartProduct',
  function($scope, CartProduct){
    $scope.message = 'Hello World';

    CartProduct.all().success(function(products){
      $scope.products = products;
    }).error(function(error){
      alert(error);
    });
}]);

app.service('CartProduct',['$http', function($http){
  var cartProduct;

  return {

    all: function(){
      return $http.get('/cart.json');
    }
  };
}]);