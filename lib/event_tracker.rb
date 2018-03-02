module EventTracker
  require 'event_tracker/version'
  require 'event_tracker/configuration'
  require 'event_tracker/jobs/tracker_job'
  require 'event_tracker/jobs/development_job'
  require 'event_tracker/jobs/mixpanel_job'
  require 'event_tracker/trackers/base'
  require 'event_tracker/trackers/development'
  require 'event_tracker/trackers/mixpanel'
  require 'event_tracker/tracker'

  class << self
    attr_writer :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.reset
    @configuration = Configuration.new
  end

  def self.configure
    yield(configuration)
  end
end
