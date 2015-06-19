require 'rails_helper'

RSpec.describe FileUpload, type: :model do
  before :each do
    extend ActionDispatch::TestProcess
    @correct_file = fixture_file_upload('origin_dictionary.txt', 'text/plain')
    @wrong_file = fixture_file_upload('wrong_file.rb', 'text/x-ruby-script')
  end

  describe "Validation" do
    context 'with a valid file' do
      it 'is valid.' do
        file = FileUpload.new file: @correct_file, content_type: @correct_file.content_type
        expect(file).to be_valid
      end
    end

    context "with invalid data." do
      it "is invalid with wrong file extension" do
        file = FileUpload.new file: @wrong_file, content_type: @wrong_file.content_type
        expect(file).to be_invalid
      end

      it 'is invalid with an empty field.' do
        file = FileUpload.new file: '', content_type: ''
        expect(file).to be_invalid
      end

      it 'is invalid with an empty file field and correct content_type.' do
        file = FileUpload.new file: '', content_type: @correct_file.content_type
        expect(file).to be_invalid
      end
    end
  end

  describe 'file_present?' do
    it 'returns true if file present.' do
      file = FileUpload.new file: @correct_file, content_type: @correct_file.content_type
      expect(file.file_present?).to be true
    end

    it 'returns false if file not present' do
      file = FileUpload.new file: '', content_type: @correct_file.content_type
      expect(file.file_present?).to be false
    end
  end
end
