'use strict'

### Controllers ###

App.controllers = angular.module('app.controllers', [])

App.controllers.controller('AppCtrl', ['$scope','$location','$rootScope','Utils',($scope, $location, $rootScope,Utils) ->

  # Uses the url to determine if the selected
  # menu item should have the class active.
  $scope.$location = $location
  $scope.$watch('$location.path()', (path) ->
    $scope.activeNavId = path || '/'
  )

  # getClass compares the current url with the id.
  # If the current url starts with the id it returns 'active'
  # otherwise it will return '' an empty string. E.g.
  #
  #   # current url = '/products/1'
  #   getClass('/products') # returns 'active'
  #   getClass('/orders') # returns ''
  #
  $scope.getClass = (id) ->
    if $scope.activeNavId.substring(0, id.length) == id
      return 'active'
    else
      return ''

  sidebar = ->
    $scope.container = $("#wrapper")
    $scope.reset  = $("html")
    $scope.reset.bind Utils.eventType(), bodyClickFn
  
    $("#menu-toggle").click (e) ->
      e.stopPropagation()
      e.preventDefault()
      $scope.container.toggleClass "active"
      false

  bodyClickFn = (evt) ->
    unless $(evt.target).hasClass("sidebar-wrapper")
      $scope.container.removeClass "active"
    
  init = =>
    sidebar()
  init()

])

App.controllers.controller('MyCtrl1', [
  '$scope'

($scope) ->
  $scope.onePlusOne = 2
])

App.controllers.controller('MyCtrl2', [
  '$scope'

($scope) ->
  $scope
])

App.controllers.controller('TodoCtrl', [
  '$scope'

($scope) ->

  $scope.todos = [
    text: "learn angular"
    done: true
  ,
    text: "build an angular app"
    done: false
  ]

  $scope.addTodo = ->
    $scope.todos.push
      text: $scope.todoText
      done: false

    $scope.todoText = ""

  $scope.remaining = ->
    count = 0
    angular.forEach $scope.todos, (todo) ->
      count += (if todo.done then 0 else 1)

    count

  $scope.archive = ->
    oldTodos = $scope.todos
    $scope.todos = []
    angular.forEach oldTodos, (todo) ->
      $scope.todos.push todo  unless todo.done

])

