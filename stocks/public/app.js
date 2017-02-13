'use strict';

var myApp = angular.module('myApp', ['ngRoute']);

// // Declare app level module which depends on filters, and services
// angular.module('myApp', ['myApp.directives']).
//   config(['$routeProvider', function($routeProvider) {
//     $routeProvider.when('/', {templateUrl: 'users-list.html', controller: UsersCtrl});
//   }]);

myApp.config(['$locationProvider', '$routeProvider', function($locationProvider, $routeProvider) {
  $routeProvider.when('/', {templateUrl: 'views/stock_list.html', controller: 'stock_listCtrl'});
  $routeProvider.when('/stock_list/', {templateUrl: 'views/stock_list.html', controller: 'stock_listCtrl'});
  $routeProvider.when('/stock/:symbol', {templateUrl: 'views/stock.html', controller: 'stockCtrl'});
  $routeProvider.when('/new', {templateUrl: 'views/new.html', controller: 'newCtrl'});
}]);

myApp.controller('stock_listCtrl', ['$scope', '$http', function($scope, $http) {
  $http.get('/stocks').then(function(r){
    $scope.symbols = r.data;
  });

}]);
myApp.controller('stockCtrl', ['$scope', '$http', '$route', function($scope, $http, $route) {
 var symbol = $route.current.params.symbol;
 $scope.stock = {};
  $http.get('/stocks/' + symbol).then(function(r){
    $scope.stock = r.data;
  });

  $scope.update = function(){
    $http.put('/stocks/' + $scope.stock.id, $scope.stock).then(function(r){
      $scope.stock = r.data;
    });
  }
}]);
myApp.controller('newCtrl', ['$scope', function($scope) {
  $scope.greeting = 'Hola!';
}]);


myApp.directive('myCustomer', function() {
  return {
  };
});

myApp.filter('urlEncode', function() {
   return function (i) {
    return window.encodeURIComponent(i);
  }
});



