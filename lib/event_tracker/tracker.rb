module EventTracker
  class Tracker
    def initialize(distinct_id, context)
      @distinct_id = distinct_id
      @context = context
    end

    # TODO: refactor to support multiple event consumers; and / or just send to Kinesis
    def track(event_name, event_label, properties = {})
      EventTracker::Jobs::MixpanelEventTrackerJob.perform_later(@distinct_id, event_name, event_label, context_with_(properties))
    end

    private

    def context_with_(properties)
      @context.merge(properties)
    end
  end
end
