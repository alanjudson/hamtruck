class TrucksController < ApplicationController

	def index
		if params[:search].present?
			@trucks = Truck.near(params[:search])
		else
			@trucks = Truck.all
		end
	end

	def show
		@truck = Truck.find(params[:id])
	end

	def edit
		@truck = Truck.find(params[:id])
	end

	def update
		@truck = Truck.find(params[:id])
		if @truck.update(truck_params)
			redirect_to @truck
		else
			render :edit
		end
	end

	def new
		@truck = Truck.new
	end

	def create
		@truck = Truck.new(truck_params)
		if @truck.save
			redirect_to @truck
		else
			render :new
		end
	end

	def destroy
		@truck = Truck.find(params[:id])
		@truck.destroy
		redirect_to trucks_url
	end

	private

	def truck_params
		params.require(:truck).permit(:name, :cuisine_type, :address, :longitude, :latitude, :image_file_name)
	end
end
