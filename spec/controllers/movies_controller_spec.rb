require 'rails_helper'

RSpec.describe MoviesController do
  let(:open_this_week_movie) { create(:movie, release_date: Time.now + 1.day) }

  describe 'GET open_this_week' do
    before(:each) do
      allow(Time).to receive(:now).and_return(Date.today.beginning_of_week.to_time)
      open_this_week_movie
      get :open_this_week
    end

    context 'when user asks to see weekly opening movies' do
      it { expect(assigns(:movies)).not_to be_empty }

      it 'should include this week movie' do
        expect(assigns(:movies).to_a).to include(open_this_week_movie)
      end
    end
  end
end