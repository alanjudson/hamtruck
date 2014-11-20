class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

# don't want to make it web accessible to all users
private

	def require_signin
		unless current_user
			redirect_to new_session_url, alert: "Please sign in first."
		end
	end
	# this was a helper method, but they can't be called from inside controllers
	def current_user
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end
	# this makes the current_user available to the views
	helper_method :current_user
end
