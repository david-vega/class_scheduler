class ClassScheduler.Views.CalendarView extends ClassScheduler.Views.Base
  template_path: 'calendar/index'

  el: '#main-container'

  renderStories: ->
    @classroomsCollection = new ClassScheduler.Collections.ClassroomsCollection
    classroomsView = new ClassScheduler.Views.ClassroomsView
      collection: @classroomsCollection
      el: @$('#teeth-stories')
      model: @model
      params: @options.params

    @classroomsCollection.fetch reset: true
