class ClassScheduler.Models.Classroom extends Backbone.Model
  urlRoot: '/api/v1/classrooms'

  defaults:
    name: ''

  validation:
    name: [
      required: true
      msg: 'This field is required'
    ]
