# frozen_string_literal: true

require 'spec_helper'

RSpec.describe EventTracker do
  it 'has a version number' do
    expect(EventTracker::VERSION).not_to be nil
  end

  describe 'configuration' do
    context 'with given block' do
      before do
        EventTracker.configure do |config|
          config.mixpanel_project_token = '1234567890987654321'
        end
      end

      it 'sets the right values' do
        expect(EventTracker.configuration.mixpanel_project_token).to eq('1234567890987654321')
      end

      context 'resetting the configuration' do
        before do
          EventTracker.reset
        end

        it 'resets the mixpanel_project_token' do
          expect(EventTracker.configuration.mixpanel_project_token).to be nil
        end
      end
    end
  end
end
