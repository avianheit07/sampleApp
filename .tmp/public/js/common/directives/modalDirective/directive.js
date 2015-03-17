app.directive("modal", function() {
  return {
    restrict: "E",
    scope: {
      show: "="
    },
    replace: true,
    transclude: true,
    link: function(scope, element, attrs) {
      scope.title = attrs.title;
      scope.hideModal = function() {
        scope.show = false;
      };
    },
    template: JST["common/directives/modalDirective/partialmodal.html"]
  };
});

//# sourceMappingURL=directive.js.map
