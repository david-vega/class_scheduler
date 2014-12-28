class ClassScheduler.Views.CalendarView extends ClassScheduler.Views.Base
  template_path: 'calendar/index'

  el: '#main-container'

  render: ->
    super
    @renderClassrooms()
    @

  renderClassrooms: ->
    @classroomsCollection = new ClassScheduler.Collections.ClassroomsCollection
    classroomsView = new ClassScheduler.Views.ClassroomsView
                                        collection: @classroomsCollection
                                        el: @$('#classrooms')
                                        view: ClassScheduler.Views.ClassroomView

    @classroomsCollection.fetch reset: true
