var view_directives = angular.module('view_directives', []);


// Page header view directive
view_directives.directive('header', ['$translate', '$rootScope', function () {
    return {
        replace: true,
        scope: {
            title: '=',
            description: '=',
            logged_user: '='
        },
        link: function ($scope, $element) {
        },
        templateUrl:  'header.html',
        controller: function ($scope, $element, $translate, $rootScope) {
            $scope.admin = ($rootScope.getUser().user_type_id == 1);
            console.log( $scope.admin);
            $scope.changeLanguage = function (langKey) {
                console.log(langKey);
                $translate.use(langKey);
            };
        }
    };
}]);
