'use strict';

// Controllers

var controllers = angular.module('controllers', ['ngCookies']);

// Index controller
controllers.controller('indexCtrl', ['$scope', '$location', 'flash', 'AuthToken',
  function($scope, $location, flash, AuthToken) {
    if(AuthToken.get('auth_token')) $location.path('/admin');
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
controllers.controller('dashboardCtrl', ['$scope', '$location', 'dashboardFactory', '$translate', '$cookieStore', '$rootScope',
  function($scope, $location, dashboardFactory, $translate, $cookieStore,$rootScope) {
    dashboardFactory.get();
    $scope.title = 'DASHBOARD';
        if($rootScope.getUser().user_type_id==1)
             $location.path('/admin');
         $location.path('/dashboard');

       $scope.openNewSymptom = function() {
        $location.path('/newSymptom');
      }
        $scope.showSymptom = function() {
          alert("This will show data of a symptom");
      }

      $scope.openNewDiagnosis = function() {
          $location.path('/newDiagnosis');
      }
      $scope.showDiagnosis = function() {
          alert("This will show data of a diagnoses");
      }

}]);

// Dashboard controller
controllers.controller('adminCtrl', ['$scope', '$location', 'usersFactory', '$translate', '$rootScope',
    function($scope, $location, usersFactory, $translate,$rootScope) {

        $scope.title = 'ADMIN';


       usersFactory.index()
            .success(function(resp) {
                $scope.users = resp.document.users;
               $rootScope.logged_user = resp.user.username;

            });
        $scope.user = $rootScope.logged_user;

    }]);

// Logout controller
controllers.controller('logoutCtrl', ['$scope', '$location', 'AuthToken', '$cookieStore',
  function($scope, $location, AuthToken, $cookieStore) {
      AuthToken.unset('auth_token');
      $cookieStore.remove('currentUser');
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

// New diagnosis controller
controllers.controller('newDiagnosisCtrl', ['$scope', '$location','diagnosesFactory','$translate',
    function($scope, $location,diagnosesFactory,$translate) {
        $scope.title = 'NEW_DIAGNOSIS';
        $scope.showDiagnosis = function() {
            window.alert("This will show data of the diagnoses");
        }

        $scope.saveDiagnosis = function() {
            diagnosesFactory.create($scope.diagnosis.name, $scope.diagnosis.code, $scope.diagnosis.description)
                .success(function (resp) {
                    $location.path('/dashboard');
                }).error(function (resp) {
                    $location.path('/newDiagnosis');
                });
        }
    }]);

controllers.controller('alertsCtrl', ['$scope', 'alertService', function($scope, alertService) {
    $scope.alerts = alertService.get();

    $scope.closeAlert = function(index) {
        alertService.close(index);
    };
}]);

controllers.controller('inboxCtrl', ['$scope', 'messagesFactory', function($scope, messagesFactory) {
    $scope.title = "INBOX";

    messagesFactory.all()
        .success(function(data) {
            $scope.messages = data.document.messages;
            $scope.summary = data.document.message;
            var chartsBuilder = new ChartsBuilder($scope.summary);
            $scope.charts = chartsBuilder.build();
        });
}]);

controllers.controller('messageCtrl', ['$scope', 'messagesFactory', '$routeParams', function($scope, messagesFactory, $routeParams) {
    $scope.title = "INBOX";

    messagesFactory.get($routeParams.id)
        .success(function(data) {
            $scope.message = data.document.message;
        });
}]);

controllers.controller('newMessageCtrl', ['$scope', 'messagesFactory', 'usersFactory', 'alertService', '$location',
    function($scope, messagesFactory, usersFactory, alertService, $location) {
        $scope.title = "INBOX";
        usersFactory.index()
            .success(function(data) {
                $scope.users = data.document.users;
            });

        $scope.sendMessage = function() {
            messagesFactory.create({
                title: $scope.subject,
                content: $scope.content,
                recipient: $scope.username
            }).success(function(data) {
                $location.path('/inbox');
            }).error(function(data) {
                alertService.add(data.status.message, 'danger');
            })


        }
    }]);

