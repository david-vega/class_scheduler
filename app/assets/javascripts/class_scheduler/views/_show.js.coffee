class ClassScheduler.Views.Show extends ClassScheduler.Views.Base
  initialize: ->
    @model.on 'change', @render, @

  events:
    'click .edit' : 'renderEditForm'

  renderEditForm: ->
    editModelView = new @editView model: @model

    @$el.append editModelView.render().$el
