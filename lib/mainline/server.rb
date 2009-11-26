module Mainline
  class Server
    def initialize(config)
      @config = config
    end
    
    def start
      options = {:Port => @config.port, :Host => "0.0.0.0"}
      
      @server = Rack::Handler::WEBrick
      require RAILS_ROOT + "/config/environment"
      inner_app = ActionController::Dispatcher.new
      inner_app.send(:build_middleware_stack)
      app = Rack::Builder.new { run inner_app }.to_app
      @server.run(app, options.merge(:AccessLog => []))
    end
  end
end