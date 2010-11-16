# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY

  s.name        = "human_detector"
  s.version     = '1.0.0.alpha'
  s.summary     = "Add something here"

  s.authors     = ["Gnomeslab, Lda."]
  s.email       = ["mail@gnomeslab.com"]
  s.homepage    = "http://gnomeslab.com/"

  s.description = "Some description that we will add later"

  s.required_rubygems_version = ">= 1.3.7"

  s.add_dependency('actionpack', ["~> 3.0.1"])
  s.add_dependency('activerecord', ["~> 3.0.1"])
  s.add_dependency('activerecord_random', ["~> 1.0.0.rc2"])

  s.add_development_dependency "sqlite3-ruby"
  s.add_development_dependency "ruby-debug19"
  s.add_development_dependency "rspec"
  s.add_development_dependency "nokogiri"
  s.add_development_dependency "factory_girl_rails"
  s.add_development_dependency "database_cleaner"

  s.files        = Dir.glob("{lib}/**/*") + %w(MIT-LICENSE README.md)
  s.require_path = 'lib'
end
