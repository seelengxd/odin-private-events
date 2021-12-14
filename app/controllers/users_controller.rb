class UsersController < ApplicationController
  def show
    @events = User.find(params[:id]).created_events
  end
end
