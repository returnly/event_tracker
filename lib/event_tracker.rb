Dir[File.join('./lib', '**', '*.rb')].each { |lib| require lib }

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
