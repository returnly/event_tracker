# EventTracker

For consistent behavioral and event tracking across Rails applications. Supports Mixpanel out of the box, and allows for implementing custom tracker plugins for additional providers.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'event_tracker', git: 'https://www.github.com/returnly/event_tracker'
```

And then execute:

    $ bundle

## Usage

### Setup
Instantiate a tracker:
```ruby
tracker = EventTracker::Tracker.new(doer_id, properties)
```
where `properties` is a hash with common event properties, e.g. session information. Then, call `tracker.track(event_name, event_label, properties)`:
```ruby
tracker.track('return.refunded.merchant', 'Merchant Refunded Return', event_context)
```
where `event_context` is a hash with extra information to be merged with the original `properties`, e.g. a tag that identifies which button triggered the action.

By default, it will use the `Development` tracker, which simply prints events to the console.

### Mixpanel Configuration
Add `event_tracker.rb` to your `config/initialiers` folder with a code similar to:
```ruby
EventTracker.configure do |config|
  config.mixpanel_project_token = 'yourTokenHere'
end
```

This will automatically register the included `Mixpanel` tracker.

### Adding a custom tracker
Create a `Tracker` and corresponding `Job` in your project like so:

_`my_tracker.rb`_
```ruby
module EventTracker
  module Trackers
    class MyTracker < EventTracker::Trackers::Base
      def track(event_name, event_label, properties)
        EventTracker::Jobs::MyJob.perform_later(@doer_id, event_name, event_label, properties)
      end
    end
  end
end

```

_`my_job.rb`_
```ruby
module EventTracker
  module Jobs
    class MyJob < EventTracker::Jobs::TrackerJob
      def perform(doer_id, event_name, event_label, properties)
        track(doer_id, event_name, event_label, properties)
      end
      
      private
      
      def track(*args)
        # Connect to your custom event-tracking provider here :)
      end
    end
  end
end
```

And to register your new tracker in your project:

```ruby
def event_tracker
  @event_tracker ||= begin
    tracker = EventTracker::Tracker.new(current_user_id, session.to_hash)
    tracker.register_tracker(EventTracker::Trackers::MyTracker)
    tracker
  end
end
```
## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/returnly/event_tracker :)

