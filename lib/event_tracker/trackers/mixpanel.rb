module EventTracker
  module Trackers
    class Mixpanel < Base
      def track(event_name, event_label, properties)
        EventTracker::Jobs::MixpanelJob.perform_later(@doer_id, event_name, event_label, properties)
      end
    end
  end
end
