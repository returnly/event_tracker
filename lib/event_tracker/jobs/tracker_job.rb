require 'active_job'

module EventTracker
  module Jobs
    class TrackerJob < ::ActiveJob::Base
      queue_as :default

      def perform(doer_id, event_name, event_label, properties)
        raise 'Implement in adapter'
      end
    end
  end
end
