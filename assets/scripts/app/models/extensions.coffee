Travis.DurationCalculations = Ember.Mixin.create
  duration: (->
    Travis.Helpers.durationFrom(@get('startedAt'), @get('finishedAt'))
  ).property('_duration', 'finishedAt', 'startedAt')

  updateTimes: ->
    unless ['rootState.loaded.reloading', 'rootState.loading'].contains @get('stateManager.currentState.path') or @get('isFinished')
      @notifyPropertyChange '_duration'
      @notifyPropertyChange 'finished_at'
