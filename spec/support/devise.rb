require_relative './controller_session_helper'

RSpec.configure do |config|
  config.include Devise::Test::ControllerHelpers, type: :controller
  config.extend ControllerSessionHelper, type: :controller
end