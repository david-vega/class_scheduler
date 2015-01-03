class ClassScheduler.Views.Collection extends ClassScheduler.Views.Base
  initialize: ->
    @collection.on 'reset', @addAll, @
    @collection.on 'add', @addOne, @

  events:
    'click .add-new' : 'renderNewForm'

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
                                el: '.add-new-form'
    @$('.add-new').hide()
    newModelView.render().$el
