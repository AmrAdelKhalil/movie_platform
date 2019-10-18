require 'rails_helper'

RSpec.describe DashboardsController do
  let!(:movie) { create(:movie) }
  let!(:open_this_week_movie) { create(:movie, release_date: Time.now + 1.day) }

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

  describe 'GET open_this_week' do
    before(:each) do
      get :open_this_week
    end

    context 'when user asks to see weekly opening movies' do
      it { expect(assigns(:movies)).not_to be_empty }

      it 'should include this week movie' do
        expect(assigns(:movies)).include(open_this_week_movie)
      end
    end
  end
end