require 'rails_helper'

RSpec.describe GenresController do
  let(:movie) { create(:movie) }
  let(:genre) { create(:genre) }

  describe 'GET movies_with_genre' do
    before(:each) do
      movie.genres << genre
      get :movies_with_genre
    end

    context 'when user asks to see movies of specific genres' do
      it 'should list movies' do
        expect(assigns(:movies)).not_to be_empty
      end
    end
  end
end