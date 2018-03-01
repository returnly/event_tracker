require 'awesome_print'

module EventTracker
  module Jobs
    class DevelopmentJob < TrackerJob
      def perform(doer_id, event_name, event_label, properties)
        puts '*' * 30
        ap "doer: #{doer_id}"
        ap "#{event_name} | #{event_label}"
        ap properties
        puts '*' * 30
      end
    end
  end
end