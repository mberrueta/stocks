'use strict';

var myApp = angular.module('myApp', ['ngRoute']);

// // Declare app level module which depends on filters, and services
// angular.module('myApp', ['myApp.directives']).
//   config(['$routeProvider', function($routeProvider) {
//     $routeProvider.when('/', {templateUrl: 'users-list.html', controller: UsersCtrl});
//   }]);

myApp.config(['$locationProvider', '$routeProvider', function($locationProvider, $routeProvider) {
  $routeProvider.when('/view1', {templateUrl: 'views/view1.html', controller: 'View1Ctrl'});
  $routeProvider.when('/view2', {templateUrl: 'views/view2.html', controller: 'View2Ctrl'});
}]);

myApp.controller('View1Ctrl', ['$scope', function($scope) {
  $scope.greeting = 'Hola!';
}]);


myApp.controller('View2Ctrl', ['$scope', function($scope) {
  $scope.greeting = 'Hola!';
}]);

myApp.directive('myCustomer', function() {
  return {
  };
});
