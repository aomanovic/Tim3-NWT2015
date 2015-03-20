health = angular.module('health',[
  'templates',
  'ngRoute',
  'controllers',
])

health.config([ '$routeProvider',
  ($routeProvider)->
    $routeProvider
    .when('/',
      templateUrl: "index.html"
      controller: 'PatientsController'
    )
])

patients = [
  {
    id: 1
    name: 'Amna Sukrija'
  },
  {
    id: 2
    name: 'Sabina Muratovic',
  },
  {
    id: 3
    name: 'Dino Osmankovic',
  },
  {
    id: 4
    name: 'Adnan Omanovic',
  },
]

controllers = angular.module('controllers',[])
controllers.controller("PatientsController", [ '$scope','$routeParams', '$location',
  ($scope,$routeParams,$location)->
    $scope.search = (keywords)->  $location.path("/").search('keywords',keywords)

    if $routeParams.keywords
      keywords = $routeParams.keywords.toLowerCase()
      $scope.patients = patients.filter (patient)-> patient.name.toLowerCase().indexOf(keywords) != -1
    else
      $scope.patients = []
])