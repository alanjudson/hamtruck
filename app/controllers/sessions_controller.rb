class SessionsController < ApplicationController
  def new
  end

  def create
  	if user = User.authenticate(params[:email],params[:password])
  		session[:user_id] = user.id
			flash[:notice] = "Welcome back, #{user.name}!"
    	redirect_to user
  	else
  		flash.now[:alert] = "Wrong email/password combo. Try again."
  		render :new
  	end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to root_url, notice: "You're signed out. Keep truckin'!"
  end
end