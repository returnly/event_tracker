require "spec_helper"

RSpec.describe EventTracker::Tracker do
  let(:distinct_id) { 1 }
  let(:event_context) {
    {
        prop1: true,
        prop2: 'test'
    }
  }
  let(:event_properties) {
    {
        prop3: 'another property'
    }
  }
  let(:event_name) { 'test event name' }
  let(:event_label) { 'test event label' }

  subject { described_class.new(distinct_id, event_context) }

  it 'enqueues a job' do
    expect(subject.track(event_name, event_label, event_context)).to have_enqueued_job(MixpanelEventTrackerJob)
  end
end
