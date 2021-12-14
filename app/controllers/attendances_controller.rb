class AttendancesController < ApplicationController
  before_action :authenticate_user!
  def create
    event_id = params[:event_id]
    Attendance.create(event_id: event_id, user_id: current_user.id)
    redirect_to Event.find(event_id)
  end
end
