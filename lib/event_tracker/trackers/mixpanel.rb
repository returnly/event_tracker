module EventTrackers::Trackers
  class Mixpanel

    # Trackers::Mixpanel.track(distinct_id, event_name, event_label, properties)

    def track(distinct_id, event_name, event_label, properties)
      tracker.track(distinct_id, event_name, properties.merge({label: event_label}))
    end

    private

    def tracker
      @tracker ||= ::Mixpanel::Tracker.new(Rails.application.secrets.mixpanel_project_token)
    end
  end
end
