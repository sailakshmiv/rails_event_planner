class SessionsController < ApplicationController
  def create
  	#this references the function we made in user.rb
  	user = User.authenticate(params[:session][:email], params[:session][:password])
  	if user.nil?
  		flash[:error] = 'Invalid Login Credentials'
  		#if there is an error, redirect back to login
  		redirect_to '/'
  	else 
  		sign_in user
  		redirect_to user
  	end
  end

  def destroy
  	sign_out
  	redirect_to '/'
  end
end
