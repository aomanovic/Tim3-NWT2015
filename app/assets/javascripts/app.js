'use strict';

var app = angular.module('app', [
  'templates',
  'ngRoute',
  'controllers',
  'auth',
  'services',
  'alertService',
  'validator',
  'custom',
  'view_directives',
  'pascalprecht.translate',
  'ui.bootstrap',
  'oi.multiselect',
  'nvd3',
  'ui.sortable',
  'ngCookies',
  'angularFileUpload'
]);

app.run(function ($rootScope, $cookieStore) {
    $rootScope.setUser=function(user)
    {
        $cookieStore.put('currentUser', user);
    };

    $rootScope.getUser=function()
    {
      return $cookieStore.get('currentUser');
    };
});

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
        when('/admin', {
            templateUrl: 'admin.html',
            controller: 'adminCtrl'
        }).
        when('/admin/resources', {
            templateUrl: 'resources.html',
             controller: 'resourcesCtrl'
        }).
        when('/admin/new_resource', {
            templateUrl: 'new_resource.html',
            controller: 'newResourceCtrl'
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
      when('/inbox', {
          templateUrl: 'inbox.html',
          controller: 'inboxCtrl'
      }).
      when('/inbox/:id', {
          templateUrl: 'message.html',
          controller: 'messageCtrl'
      }).
      when('/message/new', {
          templateUrl: 'new_message.html',
          controller: 'newMessageCtrl'
      }).
     when('/newSymptom', {
      templateUrl: 'new_symptom.html',
      controller: 'newSymptomCtrl'
      }).
      when('/newDiagnosis', {
          templateUrl: 'new_diagnosis.html',
          controller: 'newDiagnosisCtrl'
      }).
      otherwise({
        redirectTo: '/'
      });
  }]);