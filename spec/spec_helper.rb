$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'pry'
require 'pry-tree'
require 'pry/test/helper'

RSpec.configure do |config|
  config.order = 'random'
end
