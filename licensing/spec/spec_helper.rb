require 'rspec'

Bundler.require :default

require 'active_support/all'

Dir["#{File.expand_path('./../../models', __FILE__)}/*.rb"].each { |f| require f }
Dir["#{File.expand_path('./../../roles', __FILE__)}/*.rb"].each { |f| require f }