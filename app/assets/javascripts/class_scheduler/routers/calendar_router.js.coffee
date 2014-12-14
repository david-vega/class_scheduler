class ClassScheduler.Routers.CalendarRouter extends Backbone.Router
  routes:
    'calendar(/)' : 'index'
    ''            : 'redirectToCalendar'

  index: ->
    calendarView = new ClassScheduler.Views.CalendarView()
    calendarView.render().el

  redirectToCalendar: ->
    @navigate 'calendar', trigger: true