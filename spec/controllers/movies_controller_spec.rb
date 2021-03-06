require 'rails_helper'

RSpec.describe MoviesController do
  let(:open_this_week_movie) { create(:movie, release_date: Time.now + 1.day) }
  let(:movie) { create(:movie) }
  let(:actor) { create(:celebrity, name: 'amr', type: 'Actor') }
  let(:director) { create(:celebrity, name: 'adel', type: 'Director')}
  let(:user) { create(:user) }

  describe 'GET #index' do

    before(:each) do
      login(user)

      movie
      get :index, xhr: true
    end

    context 'when user asks to see weekly opening movies' do
      it { expect(assigns(:movies)).not_to be_empty }
    end
  end

  describe 'GET #show' do

    before(:each) do
      login(user)

      get :show, xhr: true, params: {id: movie.id}
    end

    context 'when user asks to see weekly opening movies' do
      it { expect(assigns(:movie)).to eq(movie) }
    end
  end

  describe 'GET #open_this_week' do

    before(:each) do
      login(user)

      allow(Time).to receive(:now).and_return(Date.today.beginning_of_week(start_day = :saturday).to_time)
      open_this_week_movie
      get :open_this_week, xhr: true
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
      login(user)
      movie.celebrities << [actor, director]
      get :search, xhr: true, params: { by_movie_name: 'a', by_celebrity_name: 'd' }
    end

    context 'when user asks to filter movies my name or celebrity names' do
      it { expect(assigns(:movies).to_a).not_to be_empty }
    end
  end

  describe 'GET #rating_info' do

    before(:each) do
      login(user)
      user.ratings << create(:rating, rate: 3, movie: movie)
      get :rating_info, xhr: true, params: { movie_id: movie.id }
    end

    context 'when user asks rating info' do
      it { expect(JSON.parse(response.body)).not_to be_empty }
    end
  end

  describe 'POST #watchlist_it' do

    context 'when user asks to add movie to watchlist' do
      before(:each) do
        login(user)
        get :watchlist_it, xhr: true, params: { movie_id: movie.id }
      end
      it 'should be added' do
        expect(JSON.parse(response.body)['success']).to be_truthy
      end
    end
  end

  describe 'GET #add_review' do

    before(:each) do
      login(user)
      get :add_review, xhr: true, params: { movie_id: movie.id, rate: 3 }
    end

    context 'when user submit a review for a movie' do
      it { expect(JSON.parse(response.body)).not_to be_empty }
    end
  end
end