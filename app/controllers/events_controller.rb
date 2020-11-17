class EventsController < ApplicationController

  def index
    events = Event.all
    render json: events, include: [:user1, :user2]
  end

  def show
    event = Event.find(params[:id])
    render json: event, include: [:user1, :user2]
  end

  def create
    event = Event.create(event_params)
    if event.valid?
        render json: event, include: [:user1, :user2]
    else
        render json: {
            errors: event.errors.full_messages
        }
    end
  end

  def destroy
    event = Event.find(params[:id])
    event.destroy
    render json: event, include: [:user1, :user2]
  end


  private

  def event_params
    params.require(:event).permit(:user1_id, :user2_id, :name, :description, :time)
  end

end
