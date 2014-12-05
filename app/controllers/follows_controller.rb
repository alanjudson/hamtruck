class FollowsController < ApplicationController
	before_action :set_truck
	# this helps us be making sure the user is signed in
	before_action :require_signin

	def create
		# creates a fan/follower through the truck relationship, setting user attribut to current_user
		@truck.follows.create!(user: current_user)

		redirect_to @truck, notice: "I'm your fan, too. <3"
	end

	def destroy
		# stores the current user's follows for this truck
		follow = current_user.follows.find(params[:id])
		follow.destroy
		redirect_to @truck, notice: "We'll change, we promise!"
	end

private

	def set_truck
		# gets the current truck
		@truck = Truck.find(params[:truck_id])
	end
end
