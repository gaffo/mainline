class ActionController::IntegrationTest
  setup :start_mainline_server
  def start_mainline_server
    @@mainline ||= Mainline::Core.new(Mainline.configuration)
    @@mainline.start
  end
end