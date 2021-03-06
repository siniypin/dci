require 'rspec'
require 'bundler'

Bundler.require :default

require 'ostruct'
require 'active_support/all'

require File.expand_path('./../../environment.rb', __FILE__)
Dir["#{File.expand_path('./../../behaviour', __FILE__)}/*.rb"].each { |f| require f }
Dir["#{File.expand_path('./../../scenarios', __FILE__)}/*.rb"].each { |f| require f }
Dir["#{File.expand_path('./../../data', __FILE__)}/*.rb"].each { |f| require f }
