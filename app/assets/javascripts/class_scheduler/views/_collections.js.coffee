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
