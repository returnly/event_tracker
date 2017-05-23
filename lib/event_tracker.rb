module EventTracker
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

require "event_tracker/version"
require "event_tracker/tracker"
require "event_tracker/jobs"
require "event_tracker/trackers"
require "event_tracker/configuration"
