require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the AnagramHelper. For example:
#
# describe AnagramHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end

RSpec.describe AnagramHelper, :type => :helper do
   describe "#searched_for_anagram?" do
     it "gives true if the argument is blank" do
       expect(helper.searched_for_anagram?('')).to eq(true)
     end
   end

   describe "#display_found_anagrams" do
     it "forms an non-empty array into a sentence." do
      array = ['dog', 'cat', 'mice']

      expect(helper.display_found_anagrams(array)).to eq('> dog, cat, and mice')
    end
  end

  describe "#display_result_msg" do
    search_value, result = 'cat', ['cat', 'act']

    it "returns poitive message" do
      expect(helper.display_result_msg(search_value, result)).to eq("#{ result.length } anagrams found for <i>#{ search_value }</i>")
    end
    
    it "returns negative message" do
      result = []

      expect(helper.display_result_msg(search_value, result)).to eq("No anagrams found for <i>#{ search_value }</i>")
    end
  end

end
