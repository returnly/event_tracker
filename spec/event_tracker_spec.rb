require "spec_helper"

RSpec.describe EventTracker do
  it "has a version number" do
    expect(EventTracker::VERSION).not_to be nil
  end
end
