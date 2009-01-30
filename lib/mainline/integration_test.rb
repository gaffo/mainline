class ActionController::IntegrationTest
  setup :start_mainline_server
  def start_mainline_server
    @@mainline ||= Mainline.new
    @@mainline.start
  end
end