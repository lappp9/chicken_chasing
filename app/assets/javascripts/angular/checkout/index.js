//= require angular/angular
//= require angular-resource/angular-resource


var app = angular.module('CheckOut', ['ngResource']);

app.config(['$httpProvider', function($httpProvider){
 $httpProvider.defaults.headers.common['X-CSRF-TOKEN'] = $('meta[name=csrf-token]').attr('content');
 $httpProvider.defaults.headers.common['X-Requested-With'] = 'XMLHttpRequest';
}]);


app.controller('CheckoutCtrl', ['$scope', '$window', 'CartProduct', 'PaymentMethod',
  function($scope, $window, CartProduct, PaymentMethod){
    $scope.cartTotal = 0;

    $scope.remove = function(product){
      CartProduct.remove(product).success(function(data){
        getProducts();
      }).error(function(error){
        alert(error);
      });
    };

    getProducts = function(){
      CartProduct.all().success(function(products){
        $scope.products = products;
        updateCartTotal();
      }).error(function(error){
        alert(error);
      });
    };
    
    updateCartTotal = function(){
      var total = 0;
      for (var i=0 ; i<$scope.products.length; i++){
        var product = $scope.products[i];
        total += product.price * product.quantity;
      }
      $scope.cartTotal = total;
    };

    PaymentMethod.all().success(function(paymentMethods){
      $scope.paymentMethods = paymentMethods;
    }).error(function(error){
      alert(error);
    });

    $scope.buy = function(){
      var order = { payment_method_id: $scope.payment_method_id, products: $scope.products };
      CartProduct.buy(order).success(function(success){
        $window.location.href="/orders";
      }).error(function(error){
        alert('error');
      });
    };

    $scope.totalFor = function(product){
      return product.price * product.quantity;
    };
    
    getProducts();
}]);

app.service('CartProduct',['$http', function($http){
  return {
    all: function(){
      return $http.get('/cart.json');
    },
    remove: function(product){
      return $http.delete('/cart/' + product.id);
    },
    buy: function(order){
      return $http.post('/orders', order);
    }
  };
}]);

app.service('PaymentMethod', ['$http', function($http){
  return {
    all: function(){
      return $http.get('/payment_methods');
    }
  };

}]);