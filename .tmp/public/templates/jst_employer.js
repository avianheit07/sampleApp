this["JST"] = this["JST"] || {};

this["JST"]["common/directives/modalDirective/partialmodal.html"] = function(obj) {
obj || (obj = {});
var __t, __p = '', __e = _.escape;
with (obj) {
__p += '<div ng-show="show" role="dialog" tabindex="-1" aria-hidden="true" class="ng-modal fade"><div ng-show="show" class="reveal-modal"><div class="row"><h4 class="title">{{ title }}</h4><a ng-click="hideModal()" class="close-reveal-modal">×</a><hr/></div><div ng-transclude="" class="row"></div></div><div ng-click="hideModal()" class="reveal-modal-bg"></div></div>';

}
return __p
};