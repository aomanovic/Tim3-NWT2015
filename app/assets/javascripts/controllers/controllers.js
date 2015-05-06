'use strict';

// Controllers

var controllers = angular.module('controllers', []);

// Index controller
controllers.controller('indexCtrl', ['$scope', '$location', 'flash', 'AuthToken',
  function($scope, $location, flash, AuthToken) {
    if(AuthToken.get('auth_token')) $location.path('/dashboard');
    $scope.flash = flash;
    $scope.openLogin = function() {
        $location.path('/login');
      }
    $scope.openSignup = function() {
        $location.path('/signup');
      }
}]);

// Login controller
controllers.controller('loginCtrl', ['$scope', '$routeParams', 'AuthService', '$location',
  function($scope, $routeParams, AuthService, $location) {
    $scope.doLogin = function() {
      AuthService.login($scope.login.email, $scope.login.password);
    }
  $scope.doReset = function() {
     $location.path('/reset');
  }
}]);

// Dashboard controller
controllers.controller('dashboardCtrl', ['$scope', '$location', 'dashboardFactory', '$translate',
  function($scope, $location, dashboardFactory, $translate) {
    dashboardFactory.get();
    $scope.title = 'DASHBOARD';

       $scope.openNewSymptom = function() {
        $location.path('/newSymptom');
      }
        $scope.showSymptom = function() {
          window.alert("This will show data of a symptom");
      }


}]);

// Logout controller
controllers.controller('logoutCtrl', ['$scope', '$location', 'AuthToken',
  function($scope, $location, AuthToken) {
      AuthToken.unset('auth_token');
      $location.path('#/');
}]);


// Signup controller
controllers.controller('signupCtrl', ['$scope', '$location', 'usersFactory', 'reCAPTCHA', 'flash',
    function($scope, $location, usersFactory, reCAPTCHA, flash) {
    $scope.submitted = false; // Set form unsubmitted to unable validation messages
    reCAPTCHA.setPublicKey('6LcYyAUTAAAAAGmKbZzezViiAFyfqp1uqwscxSWL');
    $scope.createNewUser = function() {
      if ($scope.signupform.$valid) {
        usersFactory.create($scope.user)
          .success(function(resp) {
            flash.setMessage("You received confirmation email. Please activate your account!");
            $location.path('/');
          }).error(function(resp) {
            $scope.errorMessage = resp.status.message;
          });
      } else {
        $scope.signupform.submitted = true;
      }
    }
}]);

// Reset password controller
controllers.controller('resetCtrl', ['$scope', '$location','resetFactory',
  function($scope, $location,resetFactory) {
    $scope.doReset = function() {
         resetFactory.reset_password($scope.reset.email);
         $location.path('#/login');
    }
}]);

// New symptom controller
controllers.controller('newSymptomCtrl', ['$scope', '$location','symptomFactory','$translate',
  function($scope, $location,symptomFactory,$translate) {
     $scope.title = 'NEW_SYMPTOM';
       $scope.showSymptom = function() {
          window.alert("This will show data of a symptom");
      }

    $scope.saveSymptom = function() {
        symptomFactory.create($scope.symptom.name,$scope.symptom.code,$scope.symptom.description)
          .success(function(resp) {
                $location.path('/dashboard');
          }).error(function(resp) {
            $location.path('/newSymptom');
          });

    }
}]);

