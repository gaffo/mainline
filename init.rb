if RAILS_ENV =~ /^test/ || RAILS_ENV =~ /selenium/ || RAILS_ENV =~ /cucumber/
  require 'mainline'
  require 'mainline/connection_pool'
  require 'mainline/integration_test'
end
