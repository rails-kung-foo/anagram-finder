module LoadingTimer
  extend ActiveSupport::Concern
  
    def set_start_time
      @loading_time = DateTime.now.strftime('%Q')
    end

    def set_end_time
      DateTime.now.strftime('%Q').to_i - @loading_time.to_i
    end
end
