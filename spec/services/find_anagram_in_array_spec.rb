require 'rails_helper'

describe 'FindAnagramInArray' do
  before :all do
    @file = 'spec/fixtures/origin_dictionary.txt'
  end

  describe "calling with an empty value" do
    it "has a size of 0" do
      call_with_no_value = FindAnagramInArray.call '', @file
      expect(call_with_no_value.length).to eql(0)
    end
  end

  describe "calling with a wrong value" do
    it "has a size of 0" do
      call_with_no_results = FindAnagramInArray.call 'animals', @file
      expect(call_with_no_results.length).to eql(0)
    end
  end

  describe "calling with a correct value" do
    it "has a size of 2" do
      call_with_a_result = FindAnagramInArray.call 'cta', @file
      expect(call_with_a_result.length).to eql(2)
    end

    it "returns the correct value" do
      call_with_a_result = FindAnagramInArray.call 'cta', @file
      expect(call_with_a_result).to eql(['act', 'cat'])
    end
  end
end
