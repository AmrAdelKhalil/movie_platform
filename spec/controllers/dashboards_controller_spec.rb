require 'rails_helper'

RSpec.describe DashboardsController do
  let!(:movie) { create(:movie) }

  describe 'GET index' do
    before(:each) do
      get :index
    end

    context 'when user open dashboard' do
      it{ expect(response).to have_http_status(:ok) }
    end

    context 'when user visit dashboard page' do
      it{ expect(assigns(:movies)).not_to be_empty }
    end
  end
end