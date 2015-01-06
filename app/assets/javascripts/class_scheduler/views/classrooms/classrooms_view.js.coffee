class ClassScheduler.Views.ClassroomsView extends ClassScheduler.Views.Collection

  empty_template: JST['class_scheduler/templates/classrooms/empty']

  events:
    'click .add-new-classroom' : 'renderNewForm'
