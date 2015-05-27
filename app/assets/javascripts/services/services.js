// CRUD services for application resources
var services = angular.module('services', ['ngResource', 'ngCookies']);


// Factory for users
services.factory('usersFactory', function ($http, $q, $location, $rootScope, flash) {
  return {
    create: function(user) {
      return $http.post('api/users', { user: user });
    },
    index: function() {
          return $http.get('/api/users');
    },
    is_admin: function(user) {
      return $http.post('api/users/is_admin', { user: user });
      },
    donut_data: function() {
          return $http.get('api/users/donut_data');
      },
    pie_data: function(id) {
          return $http.get('api/users/' + id + 'pie_data');
      }

  };
});

// Factory for dashboard
services.factory('dashboardFactory', function ($http, $q, $location, $rootScope, flash) {
  return {
    get: function() {
      var d = $q.defer();
      $http.get('/api/dashboard', {}).success(function(response) {
        if(response.message == "OK") {
                                          $rootScope.logged_user = response.user;
                                        }
      }).error(function(resp) {
        flash.setMessage(resp.message);
        $location.path('/');
      });
      return d.promise;
    }

  };
});




// Service for password reset
services.factory('resetFactory', function($http, $q, $rootScope, $location) {
  return {
    reset_password: function(email) {
      var d = $q.defer();
      $http.post('api/users/reset_password', {
        email: email
      }).success(function(resp) {
        if(resp.status.message == "OK") {alert("Email with password reset instruction has been sent!"); $location.path('#/login'); }
      }).error(function(resp) {
        alert("There is no user with that email account");
        $location.path('#/reset');
      });
      return d.promise;
    }
  };
});


// Factory for messages
services.factory('messagesFactory', function ($http) {
    return {
        all: function() {
            return $http.get('/api/messages')
        },
        get: function(id) {
            return $http.get('/api/messages/' + id);
        },
        create: function(params) {
            return $http.post('/api/messages', params);
        }
    };
});

// Factory for messages
services.factory('symptomsFactory', function ($http) {
    return {
        all: function() {
            return $http.get('/api/symptoms')
        },
        get: function(id) {
            return $http.get('/api/symptoms/' + id);
        },
        create: function(name,code,description) {
      return $http.post('api/symptoms', {name : name,code:code,description:description});
    }
    };
});

services.factory('diagnosesFactory', function ($http) {
    return {
        all: function() {
            return $http.get('/api/diagnoses')
        },
        get: function(id) {
            return $http.get('/api/diagnoses/' + id);
        },
        create: function(name,code,description) {
            return $http.post('api/diagnoses', {name : name,code:code,description:description});
        }
    };
});

services.factory('uploadsFactory', function ($http) {
    return {
        all: function() {
            return $http.get('api/uploads');
        },
        create: function(file) {
            return $http.post('api/uploads', { file: file });
        }
    }
});