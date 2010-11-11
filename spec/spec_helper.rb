$:.unshift File.dirname(__FILE__) unless $:.include? File.dirname(__FILE__)
$:.unshift File.join(File.dirname(__FILE__), '..') unless $:.include? File.join(File.dirname(__FILE__), '..')

begin
  require 'init'
  require 'logger'
  require 'rspec'
  require 'nokogiri'

  RSpec.configure do |config|
    config.debug = true
    # == Mock Framework
    config.mock_with :rspec
  end
rescue LoadError => load_error
  puts "Please run bundle install"
rescue StandardError => e
  puts "Something went wrong while loading the environment."
  throw e
end

# Requires supporting files with custom matchers and macros, etc, in ./support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }
