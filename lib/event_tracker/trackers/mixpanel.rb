module EventTracker::Trackers
  class Mixpanel
    def initialize(doer_id)
      @doer_id = doer_id
    end

    def track(event_name, event_label, properties)
      tracker.track(@doer_id, event_name, properties.merge({ label: event_label }))
    end

    private

    def tracker
      @tracker ||= ::Mixpanel::Tracker.new(EventTracker.configuration.mixpanel_project_token)
    end
  end
end
