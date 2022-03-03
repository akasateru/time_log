class TimeRecordsController < ApplicationController
  def create
    @time_record = current_user.time_records.build(time_record_params)
    if @time_record.save
      flash[:success] = "時間を記録しました。"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  private
    def time_record_params
      params.require(:time_record).permit(:time, :explanation, :createed_at)
    end
end
