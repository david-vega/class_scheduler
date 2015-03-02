class ClassScheduler.Views.ShowBuildingView extends ClassScheduler.Views.Show
  template_path: 'buildings/show'

  className: 'building col-md-4'

  editView: ClassScheduler.Views.EditBuildingView

  events:
    'click .show' : 'renderClassrooms'

  renderClassrooms: ->
    $('#content').html('')
    classroomsCollection = new ClassScheduler.Collections.ClassroomsCollection
    classroomsView = new ClassScheduler.Views.IndexClassroomView
                          collection: classroomsCollection
                          el: $('#content')
                          view: ClassScheduler.Views.ShowClassroomView
                          newView: ClassScheduler.Views.NewClassroomView

    classroomsCollection.fetch
                         data: $.param(building_id: @model.id)
                         reset: true
