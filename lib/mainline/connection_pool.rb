# The code below makes rails into a single db connection beast
# This is kinda dangerous and a better solution needs to be had
# Likely exposing callbacks from integration session
class ActiveRecord::ConnectionAdapters::ConnectionPool
  private
  def current_connection_id #:nodoc:
    '1'
  end
end