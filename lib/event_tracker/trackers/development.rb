module EventTracker
  module Trackers
    class Development < Base
      def track(event_name, event_label, properties)
        EventTracker::Jobs::DevelopmentJob.perform_async(@doer_id, event_name, event_label, properties)
      end
    end
  end
end
