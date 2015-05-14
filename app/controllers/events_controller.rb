class EventsController < ApplicationController

  def show
    @event = Event.find(params[:id])
    @attendees = Attendee.all #where("event_id = @event.id")
    @counter = Attendee.where(event_id: @event.id).count
    @user = User.find(session[:user_id])
    @comments = Comment.all
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      flash[:success] = 'Event was successfully created!' 
      redirect_to :back
    else
      flash[:errors] = @event.errors.full_messages 
      redirect_to :back
    end
  end

  def edit
    @event = Event.find(params[:id])
    @user = User.find(session[:user_id])
  end

  def update
    Event.find(params[:id]).update( event_params )
    flash[:success] = 'Event updated!'
    redirect_to :back
  end

  def destroy
    Event.find(params[:id]).destroy
    redirect_to :back
  end

  private 

  def event_params
    params.require(:event).permit(:name, :date, :city, :state, :user_id)
  end

end
