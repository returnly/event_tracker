# frozen_string_literal: true
require 'rails'
require_relative 'tracker_job'

module EventTracker
  module Jobs
    class DevelopmentJob < EventTracker::Jobs::TrackerJob
      def perform(doer_id, event_name, event_label, properties)
        Rails.logger.debug '*' * 30
        Rails.logger.debug "doer: #{doer_id}"
        Rails.logger.debug "#{event_name} | #{event_label}"
        Rails.logger.debug properties
        Rails.logger.debug '*' * 30
      end
    end
  end
end
