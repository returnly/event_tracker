require "spec_helper"

RSpec.describe EventTracker::Tracker do
  let(:doer_id) { 1 }
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

  subject { described_class.new(doer_id, event_context) }

  it 'calls perform_later with the right arguments' do
    allow(EventTracker::Jobs::MixpanelEventTrackerJob).to receive(:perform_later).with(1, 'test event name', 'test event label', { prop1: true, prop2: 'test' })
    subject.track(event_name, event_label)
  end

  context 'with extra properties' do
    it 'adds the extra properties' do
      allow(EventTracker::Jobs::MixpanelEventTrackerJob).to receive(:perform_later).with(1, 'test event name', 'test event label', { prop1: true, prop2: 'test', prop3: 'another property' })
      subject.track(event_name, event_label, event_properties)
    end
  end
end
