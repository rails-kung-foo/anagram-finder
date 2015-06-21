require 'rails_helper'

RSpec.describe AnagramController, :type => :controller do
  describe "#index" do
    it "returns http success" do
      get :index
      expect(response).to be_success
    end

    context 'search for angrams' do
      it 'redirects to root path' do
        get :index, search: 'time'
        expect(response).to render_template("index")
      end

      context 'search anagrams' do
        it 'that can be found' do
          get :index, search: 'time'
          expect(assigns(:result).count).to_not eq(0)
        end

        it 'that can\'t be found' do
          get :index, search: 'animaltimer'
          expect(assigns(:result).count).to eq(0)
        end
      end
    end
  end

end
