# frozen_string_literal: true

module EventTracker
  module Trackers
    class Development < Base
      def track(event_name, event_label, properties)
        EventTracker::Jobs::DevelopmentJob.perform_later(@doer_id, event_name, event_label, properties)
      end
    end
  end
end
