# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY

  s.name        = 'human_detector'
  s.version     = '1.0.0'
  s.summary     = 'A logic user friendly captcha for Rails (e.g. How much is 5 + 3?)'

  s.authors     = ["Gnomeslab, Lda."]
  s.email       = ["mail@gnomeslab.com"]
  s.homepage    = "http://gnomeslab.com/"

  s.description = "HumanDetector is a friendly logic captcha for Rails the doesn't require any external system dependency (e.g. external captcha API connections). It uses a simple question that any 7 or more years old human can understand, but that a spambot will not be able to answer. This Gem supports Ruby v1.9.2 and Rails 3.0.x."

  s.required_rubygems_version = '>= 1.3.7'

  s.add_dependency('actionpack', '~> 3.0.0')
  s.add_dependency('activerecord', '~> 3.0.0')
  s.add_dependency('activerecord_random', '~> 1.0.0')

  s.add_development_dependency 'fuubar', '~> 0.0'
  s.add_development_dependency 'sqlite3-ruby'
  s.add_development_dependency 'ruby-debug19'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'nokogiri'
  s.add_development_dependency 'factory_girl_rails'
  s.add_development_dependency 'database_cleaner'

  s.files        = Dir.glob("{lib}/**/*") + %w(MIT-LICENSE README.md)
  s.require_path = 'lib'
end
