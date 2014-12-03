	class ReviewsController < ApplicationController
	before_action :require_signin
	before_action :set_truck

	def index
		@reviews = @truck.reviews.order("created_at desc")
	end

	def new
		@review = @truck.reviews.new
	end

	def create
		@review = @truck.reviews.new(review_params)
		@review.user = current_user
		if @review.save
			redirect_to truck_path(@truck), notice: "Thanks for the review!"
		else
			render :new
		end
	end

private

	def set_truck
		@truck = Truck.find(params[:truck_id])
	end

	def review_params
		params.require(:review).permit(:comment,:stars)
	end
end
