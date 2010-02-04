require 'test_helper'

require 'mainline/nil_server'

class Mainline::NilServerTest < Test::Unit::TestCase
  
  def test_can_create
    server = Mainline::NilServer.new(nil)
    server.start
  end
  
end