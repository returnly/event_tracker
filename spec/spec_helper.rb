# frozen_string_literal: true

require 'active_job'
require 'event_tracker'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.before(:all) do
    ActiveJob::Base.queue_adapter = :test
  end
end
