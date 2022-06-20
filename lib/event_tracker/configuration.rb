# frozen_string_literal: true

module EventTracker
  class Configuration
    attr_accessor :mixpanel_project_token

    def initialize
      @mixpanel_project_token = nil
    end
  end
end
