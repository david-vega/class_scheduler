class ClassScheduler.Models.Reservation extends Backbone.Model
  urlRoot: '/api/v1/reservations'

  defaults:
    modelType: 'reservation'

  formatStartDate: ->
    @formartDate(@get 'start_time')

  formatStartTime: ->
    @formatTime(@get 'start_time')

  formatEndDate: ->
    @formartDate(@get 'end_time')

  formatEndTime: ->
    @formatTime(@get 'end_time')

  formartDate: (date) ->
    I18n.strftime(new Date(date), "%Y/%m/%d")

  formatTime: (date) ->
    I18n.strftime(new Date(date), "%H:%M")

  toJSON: ->
    _.extend {}, formatStartDate: @formatStartDate(),
                 formatStartTime: @formatStartTime(),
                 formatEndDate: @formatEndDate(),
                 formatEndTime: @formatEndTime(),
                 @attributes
