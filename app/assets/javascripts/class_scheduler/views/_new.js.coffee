class ClassScheduler.Views.New extends ClassScheduler.Views.Base
  initialize: ->
    @model.on 'error', @handleError

  events:
    'click input[type="submit"]' : 'handleNewForm'

  handleNewForm: (event) ->
    event.preventDefault()

    @model.set @params(), silent: true
    @model.save {},
      success: (response) =>
        @handleSuccess(response)

  handleSuccess: (response) ->
    @collection.add @model if @collection
    @afterSuccess() if @afterSuccess
    @remove()


  renderErrors: (errors) ->
    #TODO handle errors
