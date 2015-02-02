class ClassScheduler.Views.Edit extends ClassScheduler.Views.Base
  initialize: ->
    @model.bind "validated:invalid", @handleInvalid
    @model.on 'error', @handleError

  events:
    'click input[type="submit"]' : 'handleEditForm'

  handleEditForm: (event) ->
    event.preventDefault()

    @model.set @params(), silent: true
    @model.save {},
      success: (model, response) =>
        @handleSuccess(response)

  handleSuccess: (response) ->
    @remove()

  renderErrors: (fields, errors) ->
    #TODO handle errors

  handleInvalid: (model, errors) ->
    $('.form .error').remove()
    for key, msg of errors
      @$("##{key}").after("<div class='error'>#{msg}</div>")
