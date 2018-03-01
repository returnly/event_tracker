require './lib/event_tracker'

e = EventTracker::Tracker.new(0, context: 'here and now')

e.track('name', 'label')
