require_relative './controller_session_helper'

RSpec.configure do |config|
  config.include Devise::Test::ControllerHelpers, type: :controller
  config.include ControllerSessionHelper, type: :controller
end