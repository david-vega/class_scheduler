class ClassScheduler.Views.Collection extends ClassScheduler.Views.Base
  initialize: ->
    @collection.on 'reset', @addAll, @
    @collection.on 'add', @addOne, @

  addAll: (collection) ->
    collection.each @addOne, @
    @addEmpty collection.isEmpty()

  addOne: (model) ->
    view = new @options.view
                        model: model
                        view_params: @options.view_params
    @$el.prepend view.render().el

  addEmpty: (empty) ->
    @$el.append @empty_template empty: empty

  renderNewForm: (event) ->
    event.preventDefault()
    model = new @collection.model
    model.collection = @collection
    newModelView = new @options.newView
                                collection: @collection
                                model: model
                                el: ".add-new-#{model.get('modelType')}-form"
    @$(".add-new-#{model.get('modelType')}").hide()
    newModelView.render().$el
