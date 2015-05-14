class AttendeesController < ApplicationController
  def create
  	@attendee = Attendee.new(attendee_params)
  	@attendee.save
  	redirect_to :back
  end

  def destroy
  	Attendee.find(params[:id]).destroy
  	redirect_to :back
  end

  private 

  def attendee_params
  	params.require(:attendee).permit(:user_id, :event_id)
  end
end


