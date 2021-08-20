module EventTracker
  module Trackers
    class Base
      def initialize(doer_id)
        @doer_id = doer_id
      end

      # For programmatic determination of class/type for purposes such as
      # excepting trackers, e.g., the Mixpanel tracker type is 'mixpanel'.
      def type
        self.class.to_s.split(':').last.downcase
      end

      def track(event_name, event_label, properties)
        raise NotImplementedError, 'Implement in adapter'
      end
    end
  end
end
