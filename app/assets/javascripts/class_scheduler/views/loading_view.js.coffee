class ClassScheduler.Views.LoadingView extends ClassScheduler.Views.Base
  template_path: 'loading'

  className: 'settings-loading'

  render: ->
    @$el.html @template _.extend(@options, @helpers)
    @
