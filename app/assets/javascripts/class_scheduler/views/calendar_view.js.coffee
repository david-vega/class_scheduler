class ClassScheduler.Views.CalendarView extends ClassScheduler.Views.Base
  template_path: 'calendar/index'

  el: '#main-container'

  renderBuildings: ->
    buildingsCollection = new ClassScheduler.Collections.BuildingsCollection
    buildingsView = new ClassScheduler.Views.IndexBuildingView
                                        collection: buildingsCollection
                                        el: $('#content')
                                        view: ClassScheduler.Views.ShowBuildingView
                                        newView: ClassScheduler.Views.NewBuildingView

    buildingsCollection.fetch reset: true

  afterRender: ->
    @renderBuildings()
