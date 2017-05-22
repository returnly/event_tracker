require 'active_job'
require 'mixpanel-ruby'

module EventTracker::Jobs
  class MixpanelEventTrackerJob < ActiveJob::Base
    queue_as :default

    def perform(distinct_id, event_name, event_label, properties)
      Trackers::Mixpanel.track(distinct_id, event_name, event_label, properties)
    end
  end
end
