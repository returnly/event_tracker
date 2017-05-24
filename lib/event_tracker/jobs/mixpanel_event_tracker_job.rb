module EventTracker::Jobs
  class MixpanelEventTrackerJob < ActiveJob::Base
    queue_as :default

    def perform(doer_id, event_name, event_label, properties)
      EventTracker::Trackers::Mixpanel.new(doer_id).track(event_name, event_label, properties)
    end
  end
end
