class ClassScheduler.Views.Collection extends ClassScheduler.Views.Base
  initialize: ->
    @model = new @collection.model
    @collection.on 'reset', @collectionReset, @
    @collection.on 'add', @collectionAdd, @

  events:
    'click .add-new' : 'renderNewForm'

  collectionReset: (collection) ->
    @addAll collection
    @addEmpty()

  collectionAdd: (model) ->
    @addOne model
    @$('.empty').remove()
    @addEmpty()

  addAll: (collection) ->
    collection.each @addOne, @

  addOne: (model) ->
    view = new @options.view
                        model: model
                        view_params: @options.view_params
    @$el.append view.render().el

  addEmpty: ->
    @$el.append @empty_template empty: @collection.isEmpty()

  renderNewForm: (event) ->
    event.preventDefault()
    event.stopPropagation()

    model = @getModel()

    newModelView = new @options.newView
                                collection: @collection
                                model: model

    @$(".#{model.get('modelType')}.add-new").hide()
    @$(".#{model.get('modelType')}.empty").append newModelView.render().$el

  getModel: ->
    model = new @collection.model
    model.collection = @collection

    model.set @options.newModelOptions if @options.newModelOptions
    model
