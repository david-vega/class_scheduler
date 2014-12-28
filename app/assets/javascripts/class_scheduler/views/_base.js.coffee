class ClassScheduler.Views.Base extends Backbone.View
  template: (params = {}) ->
    @findTemplate(@template_path, params, @helpers, @base_helpers)

  model: new Backbone.Model

  base_helpers: {}

  render: ->
    @$el.html @template @model.toJSON()
    @

  params: ->
    @$('form').serializeObject()

  findTemplate: (template_path, params = null, helpers = null, base_helpers = null)->
    JST['class_scheduler/templates/' + template_path] _.extend(params, helpers, base_helpers)
