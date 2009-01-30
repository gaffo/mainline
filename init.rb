if RAILS_ENV =~ /^test/ || RAILS_ENV =~ /selenium/
  require 'mainline'
  require 'mainline/connection_pool'
  require 'mainline/integration_test'
end
