class ClassScheduler.Views.Base extends Backbone.View
  template: (params = {}) ->
    JST['class_scheduler/templates/' + @template_path] _.extend(params, @helpers, @base_helpers)

  model: new Backbone.Model

  base_helpers: {}

  render: ->
    @$el.html @template @model.toJSON()
    @afterRender() if @afterRender
    @

  params: ->
    @$('form').serializeObject()
