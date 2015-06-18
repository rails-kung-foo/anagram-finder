class FindAnagramInArray
  def self.call search_value, file = 'dictionary.txt'
    search_key = search_value.squish().downcase()
    result = []
    search_key_length = search_key.length
    contents_array = File.read(file).split(' ')

    contents_array.each do |e|
      next if search_key_length != e.length
      next if search_key.chars.sort.join != e.downcase.chars.sort.join

      result << e
    end

    result
  end
end
