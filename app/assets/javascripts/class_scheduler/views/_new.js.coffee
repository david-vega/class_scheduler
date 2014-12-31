class ClassScheduler.Views.New extends ClassScheduler.Views.Base
  initialize: ->
    @model.bind "validated:invalid", @handleInvalid
    @model.on 'error', @handleError

  events:
    'click input[type="submit"]' : 'handleNewForm'

  handleNewForm: (event) ->
    event.preventDefault()

    @model.set @params(), silent: true
    @model.save {},
      success: (model, response) =>
        @handleSuccess(response)

  handleSuccess: (response) ->
    @collection.add @model if @collection
    @afterSuccess()
    @remove()

  renderErrors: (fields, errors) ->
    #TODO handle errors

  handleInvalid: (model, errors) ->
    #TODO render error messages for each field
