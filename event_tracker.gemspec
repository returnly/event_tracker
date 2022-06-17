# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'event_tracker/version'

Gem::Specification.new do |spec|
  spec.name          = 'event_tracker'
  spec.version       = EventTracker::VERSION
  spec.authors       = ['tom']
  spec.email         = ['tom@returnly.com']

  spec.summary       = 'Gem for sharing event-tracking functionality between Rails apps'
  spec.homepage      = 'https://github.com/returnly/event_tracker'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 2.2.29'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'

  spec.add_dependency 'activejob'
  spec.add_dependency 'activerecord'
  spec.add_dependency 'mixpanel-ruby', '~> 2.2', '>= 2.2.0'
end
