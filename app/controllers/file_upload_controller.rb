class FileUploadController < ApplicationController
  before_action :set_start_time

  def new
  end

  def create
    uploaded_file = params[:file]

    if uploaded_file.blank?
      file_handling_msg = 'No file detected!'
    elsif uploaded_file.content_type == 'text/plain'
      File.write('dictionary.txt', uploaded_file.read)
      file_handling_msg = "File uploaded! in #{ @loading_time = set_end_time }ms"
    else
      file_handling_msg = 'Please upload only .txt files!'
    end

    redirect_to root_path, notice: "#{ file_handling_msg }"
  end

  private
  def set_start_time
    @loading_time = DateTime.now.strftime('%Q')
  end

  def set_end_time
    DateTime.now.strftime('%Q').to_i - @loading_time.to_i
  end
end
