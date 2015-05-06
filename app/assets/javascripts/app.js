'use strict';

var app = angular.module('app', [
  'templates',
  'ngRoute',
  'controllers',
  'auth',
  'services',
  'validator',
  'custom',
  'view_directives',
  'pascalprecht.translate',
  'ui.bootstrap'
]);

app.config(['$routeProvider',
  function($routeProvider) {
    $routeProvider.
      when('/', {
        templateUrl: 'index.html',
        controller: 'indexCtrl'
      }).
       when('/login', {
        templateUrl: 'login.html',
        controller: 'loginCtrl'
      }).
       when('/signup', {
        templateUrl: 'signup.html',
        controller: 'signupCtrl'
      }).
       when('/dashboard', {
        templateUrl: 'dashboard.html',
        controller: 'dashboardCtrl'
      }).
	     when('/reset', {
        templateUrl: 'reset.html',
        controller: 'resetCtrl'
      }).
      when('/logout', {
        templateUrl: 'index.html',
        controller: 'logoutCtrl'
      }).
       when('/newSymptom', {
        templateUrl: 'new_symptom.html',
        controller: 'newSymptomCtrl'
      }).
      otherwise({
        redirectTo: '/'
      });
  }]);