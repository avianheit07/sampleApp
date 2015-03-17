app = angular.module("RegistrationApp", [ "ngResource", "ngRoute" ])

app.config [ "$routeProvider", "$locationProvider", ($routeProvider, $locationProvider) ->
  $locationProvider.html5Mode true
  $routeProvider
  .when("/",
    template: JST["public/medicine/list.html"]()
    controller: "MedCtrl"
  )
 ]