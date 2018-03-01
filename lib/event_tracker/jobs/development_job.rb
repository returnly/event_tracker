require_relative 'tracker_job'

module EventTracker
  module Jobs
    class DevelopmentJob < EventTracker::Jobs::TrackerJob
      def perform(doer_id, event_name, event_label, properties)
        puts '*' * 30
        pp "doer: #{doer_id}"
        pp "#{event_name} | #{event_label}"
        pp properties
        puts '*' * 30
      end
    end
  end
end