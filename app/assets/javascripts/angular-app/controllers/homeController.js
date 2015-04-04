var controllers;

controllers = angular.module('controllers', []);

controllers.controller("homeController", [
    '$scope', '$routeParams', '$location', function($scope, $routeParams, $location) {
        var keywords;
        $scope.search = function(keywords) {
            return $location.path("/").search('keywords', keywords);
        };
        if ($routeParams.keywords) {
            keywords = $routeParams.keywords.toLowerCase();
            return $scope.patients = patients.filter(function(patient) {
                return patient.name.toLowerCase().indexOf(keywords) !== -1;
            });
        } else {
            return $scope.patients = [];
        }
    }
]);