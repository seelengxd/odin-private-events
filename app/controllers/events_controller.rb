class EventsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]
  def index
    @past_events = Event.past
    @present_events = Event.present
  end

  def new
    @event = current_user.created_events.build
  end

  def show
    @event = Event.find(params[:id])
  end

  def create
    @event = current_user.created_events.build(event_params)
    if @event.save
      redirect_to current_user
    else
      render :new
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :date, :location)
  end
end
