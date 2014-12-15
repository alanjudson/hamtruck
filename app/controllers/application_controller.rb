class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

# don't want to make it web accessible to all users
private

	def require_signin
		unless current_user
			# stores url you wanted to go to
			session[:intended_url] = request.url
			redirect_to new_session_url, alert: "Please sign in first."
		end
	end
	# this was a helper method, but they can't be called from inside controllers
	def current_user
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end

	def current_user?(user)
		current_user == user
	end
	# this makes the current_user available to the views
	helper_method :current_user
	helper_method :current_user?

	def require_admin
		unless current_user_admin?
			redirect_to root_url, notice: "Unauthorized access!"
		end
	end

	def current_user_admin?
		current_user && current_user.admin?
	end

	helper_method :current_user_admin?

	def location
	  if params[:location].blank?
	    if Rails.env.test? || Rails.env.development?
	      @location ||= Geocoder.search("50.78.167.161").first
	    else
	      @location ||= request.location
	    end
	  else
	    params[:location].each {|l| l = l.to_i } if params[:location].is_a? Array
	    @location ||= Geocoder.search(params[:location]).first
	    @location
	  end
	end

end
