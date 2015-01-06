class ClassScheduler.Views.ReservationsView extends ClassScheduler.Views.Collection
  initialize: ->
    super
    @model.set(classroom_id: @options.classroomId)

  empty_template: JST['class_scheduler/templates/reservations/empty']

  events:
    'click .add-new-reservation' : 'renderNewForm'
