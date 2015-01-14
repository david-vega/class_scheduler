class ClassScheduler.Views.Collection extends ClassScheduler.Views.Base
  initialize: ->
    @model = new @collection.model
    @collection.on 'reset', @collectionReset, @
    @collection.on 'add', @collectionAdd, @

  events:
    'click .add-new' : 'renderNewForm'

  collectionReset: (collection) ->
    @addAll collection
    @afterRenderView()

  collectionAdd: (model) ->
    @addOne model
    @afterRenderView()

  addAll: (collection) ->
    collection.each @addOne, @
    @addEmpty collection.isEmpty()

  addOne: (model) ->
    view = new @options.view
                        model: model
                        view_params: @options.view_params
    @$el.prepend view.render().el

  afterRenderView: ->
    @$('.add-new').show()

  addEmpty: (empty) ->
    @$el.append @empty_template empty: empty

  renderNewForm: (event) ->
    event.preventDefault()
    event.stopPropagation()

    @model.collection = @collection
    newModelView = new @options.newView
                                collection: @collection
                                model: @model
                                el: @$(".add-new-#{@model.get('modelType')}-form")

    @$('.add-new').hide()
    newModelView.render().$el
