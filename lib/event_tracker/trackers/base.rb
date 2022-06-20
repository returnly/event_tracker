# frozen_string_literal: true

module EventTracker
  module Trackers
    class Base
      def initialize(doer_id)
        @doer_id = doer_id
      end

      def track(event_name, event_label, properties)
        raise NotImplementedError, 'Implement in adapter'
      end
    end
  end
end
