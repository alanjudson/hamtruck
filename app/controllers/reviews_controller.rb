class ReviewsController < ApplicationController

	before_action :set_truck

	def index
		@reviews = @truck.reviews
	end

	def new
		@review = @truck.reviews.new
	end

	def create
		@review = @truck.reviews.new(review_params)
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
		params.require(:review).permit(:name,:comment,:stars)
	end
end
