class ClassScheduler.Views.ClassroomView extends ClassScheduler.Views.Show
  template_path: 'classrooms/show'

  className: 'classroom col-md-4'

  renderReservations: ->
    reservationsCollection = new ClassScheduler.Collections.ReservationsCollection

    reservationsView = new ClassScheduler.Views.ReservationsView
                                        collection: reservationsCollection
                                        el: @$('.reservations')
                                        view: ClassScheduler.Views.ReservationView
                                        newView: ClassScheduler.Views.NewReservationView
                                        classroomId: @model.id

    reservationsCollection.fetch
                data: $.param(classroom_id: @model.id)
                reset: true

  afterRender: ->
    @renderReservations()
