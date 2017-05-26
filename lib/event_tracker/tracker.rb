module EventTracker
  class Tracker
    def initialize(doer_id, context)
      @doer_id = doer_id
      @context = context
    end

    # TODO: refactor to support multiple event consumers; and / or just send to Kinesis
    def track(event_name, event_label, properties = {})
      EventTracker::Jobs::MixpanelEventTrackerJob.perform_later(@doer_id, event_name, event_label, context_with_(properties))
    end

    private

    def context_with_(properties)
      @context.merge(properties)
              .merge({client_event_unix_timestamp: Time.now.to_i})
    end
  end
end
