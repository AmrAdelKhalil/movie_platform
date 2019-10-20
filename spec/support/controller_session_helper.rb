module ControllerSessionHelper
  include Warden::Test::Helpers

  def login(user = FactoryBot.create(:user))
    sign_in(user, scope: :user)
  end
end