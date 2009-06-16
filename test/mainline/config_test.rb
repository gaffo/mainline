require 'test_helper'

require 'mainline/config'

class Mainline::ConfigTest < Test::Unit::TestCase
  
  def test_default_port
    config = Mainline::Config.new
    assert_equal(3001, config.port)
  end
  
end