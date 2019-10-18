require 'rails_helper'

RSpec.describe NewsesController do
  let(:news) { create(:news) }

  describe 'GET index' do
    before(:each) do
      get :index, xhr: true
    end

    context 'when user asks to see news' do
      it 'should list news' do
        expect(assigns(:news)).not_to be_empty
      end
    end
  end
end