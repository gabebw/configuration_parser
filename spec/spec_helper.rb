require 'bundler/setup'
Bundler.setup

require 'configuration_parser'

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
