require "rubygems"
require 'bundler/setup'

# ensures you're using the gem, and not the built in MT
require 'minitest/autorun'

begin; require 'turn'; rescue LoadError; end
require 'shoulda'

require 'active_record'

$:.unshift File.expand_path("../../lib", __FILE__)
require 'bitmask_attributes'


ActiveRecord::Base.establish_connection(
  :adapter  => 'sqlite3',
  :database => ':memory:'
)

ActiveSupport.on_load :active_record do
  ActiveRecord::Base.send(:include, BitmaskAttributes)
end

# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }
