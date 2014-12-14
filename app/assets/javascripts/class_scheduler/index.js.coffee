#= require_self
#
#= require_tree ./templates
#= require_tree ./models
#= require_tree ./collections
#= require_tree ./views
#= require_tree ./routers

window.ClassScheduler =
  Models: {}
  Collections: {}
  Routers: {}
  Views: {}

  calendar: ->
    ClassScheduler.CalendarRouter = new ClassScheduler.Routers.CalendarRouter()
    Backbone.history.start pushState: true

$.fn.serializeObject = ->
  @.formParams()
