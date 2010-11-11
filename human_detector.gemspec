# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY

  s.name        = "human_detector"
  s.version     = '0.0.0.alpha'
  s.summary     = "Add something here"

  s.authors     = ["Gnomeslab, Lda."]
  s.email       = ["mail@gnomeslab.com"]
  s.homepage    = "http://gnomeslab.com/"

  s.description = "Some description that we will add later"

  s.required_rubygems_version = ">= 1.3.7"

  s.add_dependency(%q<actionpack>, ["~> 3.0.0"])

  s.add_development_dependency "rspec"

  s.files        = Dir.glob("{lib}/**/*") + %w(MIT-LICENSE README.md)
  s.require_path = 'lib'
end
