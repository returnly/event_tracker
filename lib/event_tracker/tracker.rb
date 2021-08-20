module EventTracker
  class Tracker
    def initialize(doer_id, context = {})
      @doer_id = doer_id
      @context = context
      @trackers = []

      register_tracker EventTracker::Trackers::Development if development?
      register_tracker EventTracker::Trackers::Mixpanel if mixpanel?
    end

    def register_tracker(tracker)
      return false unless tracker.superclass == EventTracker::Trackers::Base

      @trackers << tracker.new(@doer_id)
      true
    end

    def track(event_name, event_label, properties = {}, options = {})
      @trackers.each do |tracker| 
        next if options[:except].include?(tracker.type)
)
        tracker.track(event_name, event_label, context_with_(properties))
      end
    end

    private

    def context_with_(properties)
      @context.merge(properties)
              .merge(client_event_unix_timestamp: Time.now.to_i)
    end

    def development?
      Rails.env.development?
    end

    def mixpanel?
      EventTracker.configuration.mixpanel_project_token.present?
    end
  end
end
