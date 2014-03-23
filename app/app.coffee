'use strict'
# Declare app level module which depends on filters, and services
App = angular.module('app', [
  'ngCookies'
  'rails'
  'ngRoute'
  'UtilsModule'
  'app.controllers'
  'app.directives'
  'app.filters'
  'app.services'
  'partials'
])

App.config([
  '$routeProvider'
  '$locationProvider'

($routeProvider, $locationProvider, config) ->

  $routeProvider

    .when('/todo', {pageTitle: "Home",templateUrl: '/partials/todo.html'})
    .when('/view1', {templateUrl: '/partials/partial1.html'})
    .when('/view2', {templateUrl: '/partials/partial2.html'})

    # Catch all
    .otherwise({redirectTo: '/todo'})

  # Without server side support html5 must be disabled.
  $locationProvider.html5Mode(false)
])

App.run [
  "$location"
  "$rootScope"
  ($location, $rootScope) ->
    $rootScope.$on "$routeChangeSuccess", (event, current, previous) ->
      $rootScope.pageTitle = current.$$route.pageTitle
      return

]

$(document).ready ->
  $("[data-toggle=offcanvas]").click ->
    $(".row-offcanvas").toggleClass "active"
    return

  return
