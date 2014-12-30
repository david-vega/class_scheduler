class ClassScheduler.Views.NewClassroomView extends ClassScheduler.Views.New
  template_path: 'classrooms/new'

  empty_template: JST['class_scheduler/templates/classrooms/empty']

  afterSuccess: ->
    $('.add-new').show()
