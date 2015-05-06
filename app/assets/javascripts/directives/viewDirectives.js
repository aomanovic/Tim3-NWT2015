var view_directives = angular.module('view_directives', []);


// Page header view directive
view_directives.directive('header', ['$translate', function() {
  return {
    replace: true,
    scope: {
      title: '=',
      description: '=',
      logged_user: '='
    },
    link: function($scope, $element) {},
    template:'<div class="row">'+
    '<div class="page-header" id="header">'+
    '<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">'+
    '<div class="container">'+
    '<div class="navbar-header">'+
    '<p style="color:white">' +
    '{{title | translate}}' +
    '<small>' +
    ' {{description}}' +
    '</small>' +
    '</p>'+
    '</div>'+
    '<div id="navbar" class="navbar-collapse collapse">'+
    '<div class="navbar-brand navbar-right">'+
    '<button class="btn btn-default" ng-click="changeLanguage(\'bs\')" translate="BUTTON_TEXT_BS"></button>' +
    '<button class="btn btn-default" ng-click="changeLanguage(\'en\')" translate="BUTTON_TEXT_EN"></button>' +
    '<button class="btn btn-default"><a ng-href="/#/logout" translate="LOGOUT"></a></button>' +
    '<button class="btn btn-default"><a ng-href="/#/dashboard" translate="DASHBOARD"></a></button>' +
    '</div>'+
    '</div>'+
    '</div>'+
    '</nav>'+
    '</div>'+
    '</div>',
    controller: function($scope, $element, $translate) {
      $scope.changeLanguage = function (langKey) {
        console.log(langKey);
        $translate.use(langKey);
      };
    }
  };
}]);
