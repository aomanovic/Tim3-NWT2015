var health, patients;

health = angular.module('health', ['templates', 'ngRoute', 'controllers']);

health.config([
    '$routeProvider', function($routeProvider) {
        return $routeProvider.when('/', {
            templateUrl: "index.html",
            controller: 'homeController'
        });
    }
]);

patients = [
    {
        id: 1,
        name: 'Amna Sukrija'
    }, {
        id: 2,
        name: 'Sabina Muratovic'
    }, {
        id: 3,
        name: 'Dino Osmankovic'
    }, {
        id: 4,
        name: 'Adnan Omanovic'
    }
];