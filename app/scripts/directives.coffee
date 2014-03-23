'use strict'

### Directives ###

# register the module with Angular
App.directives = angular.module('app.directives', ['app.services'])

App.directives.directive('appVersion', [
  'version'

(version) ->

  (scope, elm, attrs) ->
    elm.text(version)
])
