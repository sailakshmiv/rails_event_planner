class UsersController < ApplicationController
  def index	
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save 
  		flash[:success] = 'User was successfully created!'
  		redirect_to '/' 
  	else
  		flash[:errors] = @user.errors.full_messages
  		redirect_to '/'
  	end
  end

  def show 
  	@user = User.find(params[:id])
  	@events = Event.all
    @attendees = Attendee.all
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	User.find(params[:id]).update( user_params )
  	redirect_to user_path
  end

  private 

  def user_params
  	params.require(:user).permit(:first_name, :last_name, :email, :city, :state, :password, :password_confirmation)
  end
end
