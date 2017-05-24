# EventTracker

For consistent behavioral and event tracking across Rails applicaitons.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'event_tracker'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install event_tracker

## Usage

Add `event_tracker.rb` to your `config/initialiers` folder with a code similar to:
```ruby
EventTracker.configure do |config|
  config.mixpanel_project_token = 'yourTokenHere'
end
```

After that, you can instantiate a tracker with the following line:
```ruby
tracker = EventTracker::Tracker.new(doer_id, properties)
```
where `properties` is a hash, and then you can use it with:
```ruby
tracker.track('return.refunded.merchant', 'Merchant Refunded Return', extra_properties)
```
where `extra_properties` is a hash with extra information to be merged with the original `properties`.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/event_tracker.

