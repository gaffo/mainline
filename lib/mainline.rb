$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require 'webrick'
require 'rack'

module Mainline
  
  VERSION = "1.0.0"
  
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
