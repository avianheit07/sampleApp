var app;

app = angular.module("RegistrationApp", ["ngResource", "ngRoute"]);

app.config([
  "$routeProvider", "$locationProvider", function($routeProvider, $locationProvider) {
    $locationProvider.html5Mode(true);
    return $routeProvider.when("/", {
      template: JST["public/medicine/list.html"](),
      controller: "MedCtrl"
    });
  }
]);

//# sourceMappingURL=app.js.map
