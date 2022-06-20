# frozen_string_literal: true
require 'sidekiq'

module EventTracker
  module Jobs
    class TrackerJob
      include Sidekiq::Worker
      sidekiq_options queue: :default

      def perform(_doer_id, _event_name, _event_label, _properties)
        raise NotImplementedError, 'Implement in adapter'
      end
    end
  end
end
