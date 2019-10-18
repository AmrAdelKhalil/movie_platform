require 'rails_helper'

RSpec.describe MoviesController do
  let(:open_this_week_movie) { create(:movie, release_date: Time.now + 1.day) }
  let(:movie) { create(:movie) }
  let(:actor) { create(:celebrity, name: 'amr', type: 'Actor') }
  let(:director) { create(:celebrity, name: 'adel', type: 'Director')}

  describe 'GET #open_this_week' do
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

  describe 'GET #search' do
    before(:each) do
      get :search, xhr: true, params: { by_movie_name: 'a', by_celebrity_name: 'd' }
    end

    context 'when user asks to filter movies my name or celebrity names' do
      it { expect(assigns(:movies).to_a).not_to be_empty }
    end
  end
end