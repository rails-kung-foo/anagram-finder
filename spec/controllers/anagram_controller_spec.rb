require 'rails_helper'

RSpec.describe AnagramController, :type => :controller do  
  describe "#index" do
    it "returns http success" do
      expect(response).to be_success
    end
  end

  describe '#create' do
    it 'redirects to root path' do
      post :create, search: 'time'
      expect(response).to redirect_to root_path
    end

    context 'search anagrams' do
      it 'that can be found' do
        post :create, search: 'time'
        expect(assigns(:result).count).to_not eq(0)
      end

      it 'that can\'t be found' do
        post :create, search: 'animaltimer'
        expect(assigns(:result).count).to eq(0)
      end
    end
  end



end
