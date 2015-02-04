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

  removeView: ->
    @remove()

  renderLoader: (element, message = 'Loading...') ->
    loadingView = new ClassScheduler.Views.LoadingView
                                      message: message

    @loader = loadingView.render().$el.appendTo(element)

  removeLoader: ->
    @loader.remove() if @loader
