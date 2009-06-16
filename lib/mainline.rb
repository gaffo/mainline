require 'webrick'
require 'rack'

module Mainline
  
  VERSION = "0.0.1"
  def initialize()
    @started = false
  end
  
  def start
    return if @started
    Thread.new do
      @server = Mainline::Server.new(@config)
      @server.start
    end
    @started = true
  end
  
end

require 'mainline/core'
