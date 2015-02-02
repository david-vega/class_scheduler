class ClassScheduler.Views.ClassroomView extends ClassScheduler.Views.Show
  template_path: 'classrooms/show'

  className: 'classroom col-md-4'

  events:
    'click .edit' : 'renderEditClassroom'

  renderReservations: ->
    reservationsCollection = new ClassScheduler.Collections.ReservationsCollection

    reservationsView = new ClassScheduler.Views.ReservationsView
                                          collection: reservationsCollection
                                          el: @$('.reservations')
                                          view: ClassScheduler.Views.ReservationView
                                          newView: ClassScheduler.Views.NewReservationView
                                          newModelOptions: { classroom_id: @model.id }

    reservationsCollection.fetch
                data: $.param(classroom_id: @model.id)
                reset: true

  afterRender: ->
    @renderReservations()

  renderEditClassroom: ->
    editModelView = new ClassScheduler.Views.EditClassroomView
                                       model: @model



    @$el.append editModelView.render().$el
