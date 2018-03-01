require 'mixpanel-ruby'

module EventTracker
  module Jobs
    class MixpanelJob < TrackerJob
      def perform(doer_id, event_name, event_label, properties)
        tracker.track(doer_id, event_name, event_label, properties)
      end

      private

      def tracker
        @tracker ||= ::Mixpanel::Tracker.new(EventTracker.configuration.mixpanel_project_token)
      end
    end
  end
end