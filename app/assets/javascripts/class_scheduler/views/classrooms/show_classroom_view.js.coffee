class ClassScheduler.Views.ShowClassroomView extends ClassScheduler.Views.Show
  template_path: 'classrooms/show'

  className: 'classroom col-md-6'

  editView: ClassScheduler.Views.EditClassroomView

  renderReservations: ->
    reservationsCollection = new ClassScheduler.Collections.ReservationsCollection

    reservationsView = new ClassScheduler.Views.IndexReservationView
                                          collection: reservationsCollection
                                          el: @$('.reservations')
                                          view: ClassScheduler.Views.ReservationView
                                          newView: ClassScheduler.Views.NewReservationView
                                          newModelOptions: { classroom_id: @model.id }

    reservationsCollection.fetch
                data: $.param(classroom_id: @model.id)
                reset: true
