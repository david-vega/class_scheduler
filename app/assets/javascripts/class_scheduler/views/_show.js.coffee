class ClassScheduler.Views.Show extends ClassScheduler.Views.Base
  initialize: ->
    @model.on 'change', @render, @

  events:
    'click .remove'     : 'renderRemoveDialog'
    'click .edit'       : 'renderEditDialog'

  renderRemoveDialog: (event) ->
    #TODO to be implemented

  renderEditDialog: (event) ->
    #TODO to be implemented
