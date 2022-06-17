# frozen_string_literal: true

require 'active_job'

module EventTracker
  module Jobs
    class TrackerJob < ::ActiveJob::Base
      queue_as :default

      def perform(_doer_id, _event_name, _event_label, _properties)
        raise NotImplementedError, 'Implement in adapter'
      end
    end
  end
end
