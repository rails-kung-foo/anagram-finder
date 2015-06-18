require 'rails_helper'

RSpec.describe FileUploadController, :type => :controller do

  describe "#create" do
    context 'with an empty field' do
      it 'redirects to root path' do
        post :create, file: ''
        expect(response).to redirect_to root_path
      end

      it 'flash message says "No file detected!"' do
        post :create, file: ''
        expect(flash[:danger]).to eq 'can\'t be blank'
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

      it 'flash message displays "Only txt files are allowed"' do
        post :create, file: @wrong_file
        expect(flash[:danger]).to eq 'Only txt files are allowed'
      end
    end

    context 'with valid file' do
      before :each do
        @file = fixture_file_upload('origin_dictionary.txt', 'text/plain')
      end

      it 'redirects to root path' do
        post :create, file: @file
        expect(response).to redirect_to root_path
      end

      it 'flash message begins with "File uploaded!"' do
        post :create, file: @file
        expect(flash[:notice]).to match /File uploaded!/
      end
    end
  end

end
