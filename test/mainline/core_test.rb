require 'test_helper'

require 'mainline/core'
require 'mainline/server'
require 'mainline/nil_server'

class Mainline::CoreTest < Test::Unit::TestCase
  
  def test_server_doesnt_start_when_not_configured
    config = mock("Mainline::Config")    
    Mainline::NilServer.any_instance.expects(:start).times(1)
    Mainline::Core.new(nil).start
  end
  
  def test_mainline_with_config_starts_server
    config = mock("Mainline::Config")
    mock_server = mock("Mainline::Server")
    Mainline::Server.expects(:new).with(config).returns(mock_server)
    mock_server.expects(:start)
    
    Mainline::Core.new(config).start
  end
  
  def test_configed_mainline_doesnt_start_server_twice
    config = mock("Mainline::Config")
    mock_server = mock("Mainline::Server")
    Mainline::Server.expects(:new).with(config).returns(mock_server)
    mock_server.expects(:start)
    
    mainline = Mainline::Core.new(config)
    mainline.start
    mainline.start
  end
  
end