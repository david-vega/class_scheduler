class ClassScheduler.Views.ReservationsView extends ClassScheduler.Views.Collection

  empty_template: JST['class_scheduler/templates/reservations/empty']

  events:
    'click .add-new-reservation' : 'renderNewForm'
