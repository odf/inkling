require 'rubygems'
require 'bundler'
require 'bundler/setup'

Bundler.require :default, :development

Combustion.initialize!
# Bundler.require :default, :development


# require File.expand_path(File.dirname(__FILE__) + "/../config/environment") #nf patching generated spec_helper
#require File.dirname(__FILE__) + "/../config/environment" unless defined?(Rails)
require 'rspec/rails'
require 'capybara/rspec'

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

Rspec.configure do |config|
  # == Mock Framework
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr
  config.mock_with :rspec

  # If you'd prefer not to run each of your examples within a transaction,
  # uncomment the following line.
  # config.use_transactional_examples = false
  config.use_transactional_examples = true
end

class TestAtom
  # The generate method makes it look like a good Inkling::Feed::Format:
  def self.generate()
  end
  
  def self.responds_to
    :atom
  end
end