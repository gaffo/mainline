require 'webrick'
require 'rack'

class  Mainline
  def initialize()
    @started = false
  end
  
  def start
    return if @started
    @started = true
    Thread.new do 
      self.do_start
    end
  end
  
  def do_start
    options = {:Port => 3005, :Host => "0.0.0.0"}
    server = Rack::Handler::WEBrick
    require RAILS_ROOT + "/config/environment"
    inner_app = ActionController::Dispatcher.new
    app = Rack::Builder.new {
      use Rails::Rack::Static
      run inner_app
    }.to_app
    trap(:INT) { exit }
    server.run(app, options.merge(:AccessLog => []))
  end
end
