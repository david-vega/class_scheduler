class ClassScheduler.Models.Building extends Backbone.Model
  urlRoot: '/api/v1/buildings'

  defaults:
    name: ''
    modelType: 'building'

  validation:
    name: [
      required: true
      msg: 'This field is required'
    ]
