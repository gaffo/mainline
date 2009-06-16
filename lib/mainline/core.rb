module Mainline
  
  # Configures Mainline. If this is not done, Mainline will not be activated
  def self.enable(configuration = Mainline.configuration)
    yield configuration if block_given?
    @@configuration = configuration
  end

  def self.configuration # :nodoc:
    defined?(@@configuration) ? @@configuration : nil
  end
  
  class Core
    
    def initialize(configuration)
      @config = configuration
    end
    
    def start
      unless @server
        if @config
          @server = Mainline::Server.new(@config)
        else
          @server = Mainline::NilServer.new(@config)
        end
        Thread.new do
          @server.start
        end
      end
    end
    
  end
end