class FileUploadController < ApplicationController
  include LoadingTimer

  before_action :set_start_time

  def new
  end

  def create
    @file = FileUpload.new file: filter_params
    @file.content_type = filter_params.content_type if filter_params.respond_to? :content_type

    if @file.valid?
      File.write('dictionary.txt', params[:file].read)
      flash[:notice] = "File uploaded! in #{ @loading_time = set_end_time }ms"
    else
      @file.errors.each do |k, v|
        flash[:danger] = v
      end
    end

    redirect_to root_path
  end

  private
  def filter_params
   params.slice(:file)[:file]
 end
end
