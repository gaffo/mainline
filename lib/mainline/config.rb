module Mainline
  class Config
    
    # the port that mainline is going to open on
    attr_accessor :port
    
    def initialize # :nodoc:
      self.port = 3001
    end
  end
end