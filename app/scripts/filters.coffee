'use strict'

### Filters ###

App.filters = angular.module('app.filters', [])

App.filters.filter('interpolate', [
  'version',

(version) ->
  (text) ->
    String(text).replace(/\%VERSION\%/mg, version)
])
