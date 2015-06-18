require 'rails_helper'

RSpec.describe FileUploadController, :type => :controller do
  before :each do
    @file = fixture_file_upload('origin_dictionary.txt')
  end

  describe "#create" do
    it "redirects to root path" do
      get :create
      expect(response).to redirect_to root_path
    end

    context 'with an empty field' do
      it 'redirects to root path' do
        post :create, file: ''
        expect(response).to redirect_to root_path
      end

      it 'flash message says "No file detected!"' do
        post :create, file: ''
        expect(flash[:danger]).to eq 'No file detected!'
      end

      it 'validation is invalid.' do
        post :create, file: ''
        expect(@file).to be_invalid?
      end
    end

    context 'with an wrong file extension' do
      before :each do
        @wrong_file = fixture_file_upload('wrong_file.rb')
      end

      it 'redirects to root path' do
        post :create, file: @wrong_file
        expect(response).to redirect_to root_path
      end

      it 'flash message says "Please upload only .txt files!"' do
        post :create, file: @wrong_file
        expect(flash[:notice]).to eq 'Please upload only .txt files!'
      end
    end
  end

end
