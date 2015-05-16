module AnagramHelper

  def searched_for_anagram? search_value
    search_value.blank?
  end

  def display_result_date_time
    "#{ Time.now.strftime '%Y.%m.%d %H:%M:%S' }"
  end

  def display_result_msg search_value, result
    if result.length > 0
      return_msg = "#{ result.length } anagrams found for "
    else
      return_msg = "No anagrams found for "
    end

    return_msg << "#{ content_tag :i, search_value }"
    return_msg.html_safe
  end

  def display_found_anagrams result
    if result.length > 0
    "> #{ result.to_sentence }"
    end
  end

end
