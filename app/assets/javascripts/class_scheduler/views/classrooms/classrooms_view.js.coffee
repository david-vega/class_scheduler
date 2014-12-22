class ClassScheduler.Views.ClassroomsView extends ClassScheduler.Views.Base
  initialize: ->
    @collection.on 'reset', @addAll, @

  addAll: (collection) ->
    collection.each @addOne, @

  addOne: (model) ->
    classroomView = new ClassScheduler.Views.ClassroomView model: model
    @$el.prepend classroomView.render().el
