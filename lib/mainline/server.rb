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
      app = Rack::Builder.new {
        use Rails::Rack::Static
        run inner_app
      }.to_app
#      
#      trap(:INT) do 
#        @server.stop
#        Kernel.exit
#        thread.join
#      end
      
      @server.run(app, options.merge(:AccessLog => []))
    end
  end
end