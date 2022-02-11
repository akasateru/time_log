class StaticPagesController < ApplicationController
  def home
    @time_record = current_user.time_records.build if logged_in?
  end
end
