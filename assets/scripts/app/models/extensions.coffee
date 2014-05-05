Travis.DurationCalculations = Ember.Mixin.create
  duration: (->
    startedAt = null
    if @get('isMatrix')
      jobs = @get('jobs').map (data) -> data.get('startedAt')
      startedAt = jobs.sort()[0]
    else
      startedAt = @get('startedAt')
    Travis.Helpers.durationFrom(startedAt, @get('finishedAt'))
  ).property('_duration', 'finishedAt', 'startedAt', 'jobs.@each.startedAt')

  updateTimes: ->
    unless ['rootState.loaded.reloading', 'rootState.loading'].contains @get('stateManager.currentState.path') or @get('isFinished')
      @notifyPropertyChange '_duration'
      @notifyPropertyChange 'finished_at'
