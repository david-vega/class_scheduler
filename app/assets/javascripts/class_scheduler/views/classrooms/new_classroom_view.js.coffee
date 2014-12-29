class ClassScheduler.Views.NewClassroomView extends ClassScheduler.Views.Base
  template_path: 'classrooms/new'

  initialize: ->
    @model.on 'error', @handleError

  events:
    'click input[type="submit"]' : 'handleNewClassroomForm'

  handleNewClassroomForm: (event) ->
    event.preventDefault()
    @model.clear silent: true
    @model.set @params(),
      silent: true
    @model.save {},
      success: (model,response) =>
        @handleSuccess(response)

  handleSuccess: (response) =>
    @collection.add @model

  renderErrors: (errors) =>
    #TODO handle errors
