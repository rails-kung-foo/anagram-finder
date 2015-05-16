class AnagramController < ApplicationController
  before_action :set_start_time

  def index
  end

  def create
    @search_value = params[:search]
    unless @search_value.blank?
      @result = FindAnagramInArray.call @search_value
      @loading_time = set_end_time
    end

    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  end

  private
  def set_start_time
    @loading_time = DateTime.now.strftime('%Q')
  end

  def set_end_time
    DateTime.now.strftime('%Q').to_i - @loading_time.to_i
  end
end
