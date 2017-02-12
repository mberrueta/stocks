'use strict';

var myApp = angular.module('myApp', ['ngRoute']);

// // Declare app level module which depends on filters, and services
// angular.module('myApp', ['myApp.directives']).
//   config(['$routeProvider', function($routeProvider) {
//     $routeProvider.when('/', {templateUrl: 'users-list.html', controller: UsersCtrl});
//   }]);

myApp.config(['$locationProvider', '$routeProvider', function($locationProvider, $routeProvider) {
  $routeProvider.when('/', {templateUrl: 'views/stock_list.html', controller: 'stock_listCtrl'});
  $routeProvider.when('/stock', {templateUrl: 'views/stock.html', controller: 'stockCtrl'});
}]);

myApp.controller('stock_listCtrl', ['$scope', '$http', function($scope, $http) {
  $http.get('/stocks').then(function(r){
    $scope.symbols = r.data;
  });

}]);


myApp.controller('stockCtrl', ['$scope', function($scope) {
  $scope.greeting = 'Hola!';
}]);

myApp.directive('myCustomer', function() {
  return {
  };
});
