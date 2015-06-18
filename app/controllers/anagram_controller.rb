class AnagramController < ApplicationController
  include LoadingTimer

  before_action :set_start_time

  def index
    @search_value = params[:search]

    unless @search_value.blank?
      @result = FindAnagramInArray.call @search_value
      @loading_time = set_end_time
    end

    respond_to do |format|
      format.html
      format.js
    end
  end
end
