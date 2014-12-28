#= require_self
#
#= require_tree ./templates
#= require_tree ./models
#= require_tree ./collections
#= require_tree ./views
#= require_tree ./routers

($ document).ajaxSend (event, jqxhr, settings) ->
  jqxhr.setRequestHeader 'X-CSRF-Token', $('meta[name="csrf-token"]').attr('content')

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

Backbone.View = ((View) ->
  View.extend constructor: (options) ->
    @options = options || {}
    View.apply @, arguments
)(Backbone.View)
