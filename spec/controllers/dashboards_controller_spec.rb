require 'rails_helper'

RSpec.describe DashboardsController do
  let!(:movie) {create(:movie)}

  describe 'GET index' do
    subject {get :index}
    context 'when user visit dashboard page' do
      it{ is_expected.to have_http_status(:ok) }
      it{ expect(assigns(:movies)).not_to be_empty }
    end
  end
end