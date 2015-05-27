'use strict';

// Controllers

var controllers = angular.module('controllers', ['ngCookies']);

// Index controller
controllers.controller('indexCtrl', ['$scope', '$location', 'flash', 'AuthToken',
    function ($scope, $location, flash, AuthToken) {
        if (AuthToken.get('auth_token')) $location.path('/admin');
        $scope.flash = flash;
        $scope.openLogin = function () {
            $location.path('/login');
        }
        $scope.openSignup = function () {
            $location.path('/signup');
        }
    }]);

// Login controller
controllers.controller('loginCtrl', ['$scope', '$routeParams', 'AuthService', '$location',
    function ($scope, $routeParams, AuthService, $location) {
        $scope.doLogin = function () {
            AuthService.login($scope.login.email, $scope.login.password);
        }
        $scope.doReset = function () {
            $location.path('/reset');
        }
    }]);

// Dashboard controller
controllers.controller('dashboardCtrl', ['$scope', '$location', 'dashboardFactory', '$translate', '$cookieStore', '$rootScope',
    function ($scope, $location, dashboardFactory, $translate, $cookieStore, $rootScope) {
        dashboardFactory.get();
        $scope.title = 'DASHBOARD';
        if ($rootScope.getUser().user_type_id == 1)
            $location.path('/admin');
        $location.path('/dashboard');

        $scope.openNewSymptom = function () {
            $location.path('/newSymptom');
        }
        $scope.showSymptom = function () {
            alert("This will show data of a symptom");
        }

        $scope.openNewDiagnosis = function () {
            $location.path('/newDiagnosis');
        }
        $scope.showDiagnosis = function () {
            alert("This will show data of a diagnoses");
        }

}]);

// Dashboard controller
controllers.controller('adminCtrl', ['$scope', '$location', 'usersFactory', '$translate', '$rootScope', '$cookieStore',
    function ($scope, $location, usersFactory, $translate, $rootScope, $cookieStore) {

        $scope.title = 'ADMIN';
        //usersFactory.donut_data()
        //    .success(function(data) {
        //        $rootScope.donut = data.document.users;
        //        alert(data.document.users[1].email);
        //    });

        //var txx = $rootScope.donut;
        //var administrator, pacijent, osoblje = 0;
        //administrator = txx[1];
        //pacijent = txx[2];
        //osoblje = txx[3];
        //var ddata1 = [
        //    {
        //        value: administrator,
        //        color:"#F7464A"
        //    },
        //    {
        //        value : pacijent,
        //        color : "#36ea30"
        //    },
        //    {
        //        value : osoblje,
        //        color : "#4d53d4"
        //    }
        //];
        //var ctx = document.getElementById("myChart1").getContext("2d");
        //var myDoughnutChart = new Chart(ctx).Doughnut(ddata1, {
        //    animateScale: true
        //});


        //usersFactory.pie_data()
        //    .success(function(data) {
        //        $rootScope.pie = data.document.users;
        //    });

        //var txx2 = $rootScope.pie;
        //var aktiviranih, neaktiviranih = 0;
        //aktiviranih = txx2.true;
        //neaktiviranih = txx2.false;
        //var ddata2 = [
        //    {
        //        value: aktiviranih,
        //        color:"#12f7b2"
        //    },
        //    {
        //        value : neaktiviranih,
        //        color : "#ea0dc5"
        //    }
        //];
        //var ctx2 = document.getElementById("myChart2").getContext("2d");
        //var myPieChart = new Chart(ctx).Pie(ddata2);
    }]);

// Logout controller
controllers.controller('logoutCtrl', ['$scope', '$location', 'AuthToken', '$cookieStore',
    function ($scope, $location, AuthToken, $cookieStore) {
        AuthToken.unset('auth_token');
        $cookieStore.remove('currentUser');
        $location.path('#/');
    }]);


// Signup controller
controllers.controller('signupCtrl', ['$scope', '$location', 'usersFactory', 'reCAPTCHA', 'flash',
    function ($scope, $location, usersFactory, reCAPTCHA, flash) {
        $scope.submitted = false; // Set form unsubmitted to unable validation messages
        reCAPTCHA.setPublicKey('6LcYyAUTAAAAAGmKbZzezViiAFyfqp1uqwscxSWL');
        $scope.createNewUser = function () {
            if ($scope.signupform.$valid) {
                usersFactory.create($scope.user)
                    .success(function (resp) {
                        flash.setMessage("You received confirmation email. Please activate your account!");
                        $location.path('/');
                    }).error(function (resp) {
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
controllers.controller('newSymptomCtrl', ['$scope', '$location','symptomsFactory','$translate', 'alertService',
  function($scope, $location,symptomsFactory,$translate, alertService) {
     $scope.title = 'NEW_SYMPTOM';

    $scope.saveSymptom = function() {
        symptomsFactory.create($scope.symptom.name,$scope.symptom.code,$scope.symptom.description)
            .success(function (data) {
                $location.path('/symptoms');
            }).error(function (data) {
                $location.path('/dashboard');
            });
    }
}]);

// New diagnosis controller
controllers.controller('newDiagnosisCtrl', ['$scope', '$location', 'diagnosesFactory', '$translate',
    function ($scope, $location, diagnosesFactory, $translate) {
        $scope.title = 'NEW_DIAGNOSIS';

        $scope.saveDiagnosis = function () {
            diagnosesFactory.create($scope.diagnosis.name, $scope.diagnosis.code, $scope.diagnosis.description)
                .success(function (resp) {
                    $location.path('/diagnoses');
                }).error(function (resp) {
                    $location.path('/dashboard');
                });
        }
    }]);

controllers.controller('alertsCtrl', ['$scope', 'alertService', function ($scope, alertService) {
    $scope.alerts = alertService.get();

    $scope.closeAlert = function (index) {
        alertService.close(index);
    };
}]);

controllers.controller('inboxCtrl', ['$scope', 'messagesFactory', function ($scope, messagesFactory) {
    $scope.title = "INBOX";

    messagesFactory.all()
        .success(function (data) {
            $scope.messages = data.document.messages;
            $scope.summary = data.document.message;

        });
}]);

controllers.controller('symptomsCtrl', ['$scope', 'symptomsFactory', function ($scope, symptomsFactory) {
    $scope.title = "SYMPTOMS";

    symptomsFactory.all()
        .success(function (data) {
            $scope.symptoms = data.document.symptoms;
            $scope.summary = data.document.symptom;
        });
}]);

controllers.controller('symptomCtrl', ['$scope', 'symptomsFactory', '$routeParams', function ($scope, symptomsFactory, $routeParams) {
    $scope.title = "SYMPTOMS";

    symptomsFactory.get($routeParams.id)
        .success(function (data) {
            $scope.symptom = data.document.symptom;
        });
}]);

controllers.controller('diagnosesCtrl', ['$scope', 'diagnosesFactory', function ($scope, diagnosesFactory) {
    $scope.title = "DIAGNOSES";

    diagnosesFactory.all()
        .success(function (data) {
            $scope.diagnoses = data.document.diagnoses;
            $scope.summary = data.document.diagnosis;
        });
}]);

controllers.controller('diagnosisCtrl', ['$scope', 'diagnosesFactory', '$routeParams', function ($scope, diagnosesFactory, $routeParams) {
    $scope.title = "DIAGNOSES";

    diagnosesFactory.get($routeParams.id)
        .success(function (data) {
            $scope.diagnosis = data.document.diagnosis;
        });
}]);

controllers.controller('messageCtrl', ['$scope', 'messagesFactory', '$routeParams', function ($scope, messagesFactory, $routeParams) {
    $scope.title = "INBOX";

    messagesFactory.get($routeParams.id)
        .success(function (data) {
            $scope.message = data.document.message;
        });
}]);

controllers.controller('newMessageCtrl', ['$scope', 'messagesFactory', 'usersFactory', 'alertService', '$location',
    function ($scope, messagesFactory, usersFactory, alertService, $location) {
        $scope.title = "INBOX";
        usersFactory.index()
            .success(function (data) {
                $scope.users = data.document.users;
            });

        $scope.sendMessage = function () {
            messagesFactory.create({
                title: $scope.subject,
                content: $scope.content,
                recipient: $scope.username
            }).success(function (data) {
                $location.path('/inbox');
            }).error(function (data) {
                alertService.add(data.status.message, 'danger');
            })


        }
    }]);

controllers.controller('resourcesCtrl', ['$scope', 'uploadsFactory', '$cookieStore', function ($scope, uploadsFactory, $cookieStore) {
    $scope.title = "RESOURCES";
    $scope.user_id = $cookieStore.get('currentUser').id;

    uploadsFactory.all()
        .success(function (data) {
            console.log(data);
            $scope.resources = data.document.resources;
        });
}]);

controllers.controller('newResourceCtrl', ['$scope', 'uploadsFactory', '$location', 'FileUploader', '$cookieStore',
    function ($scope, uploadsFactory, $location, FileUploader, $cookieStore) {
        $scope.title = "RESOURCES";
        alert($cookieStore.get('currentUser').id);
        $scope.uploader = new FileUploader({url: '/api/uploads'});


        $scope.upload = function () {
            $scope.file = $scope.uploader.uploadItem(0);
            uploadsFactory.create($scope.file);
            $location.path('/admin');
        }
    }]);

