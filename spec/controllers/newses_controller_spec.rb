require 'rails_helper'

RSpec.describe NewsesController do
  let!(:news) { create(:news) }

  describe 'GET #index' do
    before(:each) do
      get :index, xhr: true
    end

    context 'when user asks to see news' do
      it 'should list news' do
        expect(assigns(:news)).not_to be_empty
      end
    end
  end

  describe 'GET #search'do
    before(:each) do
      get :search, xhr: true, params: {by_descrption: news.description[0]}
    end

    context 'when user filter news by content' do
      it { expect(assigns(:news)).not_to be_empty }
    end
  end
end