class TrucksController < ApplicationController
	before_action :require_signin, except: [:index, :show]
	before_action :require_admin, except: [:index, :show]

	def index
		if params[:search].present?
			@trucks = Truck.near(params[:search])
		else
			@trucks = Truck.recent
		end
		@hash = Gmaps4rails.build_markers(@trucks) do |truck, marker|
		  marker.lat truck.latitude
		  marker.lng truck.longitude
		  marker.infowindow truck.name
		  marker.picture({
		      "url" => "https://upload.wikimedia.org/wikipedia/commons/0/0a/Map_marker_icon_%E2%80%93_Nicolas_Mollet_%E2%80%93_Truck_%E2%80%93_Transportation_%E2%80%93_Default.png",
		      "width" =>  36,
		      "height" => 36})
		  marker.json({ title: truck.name })
		end
	end

	def show
		@truck = Truck.friendly.find(params[:id])
		@review = Review.new
		@reviews = @truck.display_reviews
		@fans = @truck.fans
		@cuisine_types = @truck.cuisine_types

		if current_user
			@current_fan = current_user.follows.find_by(truck_id: @truck.id)
		end
	end

	def edit
		@truck = Truck.friendly.find(params[:id])
	end

	def update
		@truck = Truck.friendly.find(params[:id])
		if @truck.update(truck_params)
			flash[:notice] = "Event successfully updated."
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
		@truck = Truck.friendly.find(params[:id])
		@truck.destroy
		redirect_to trucks_url
	end

	private

	def truck_params
		params.require(:truck).permit(:name, :cuisine_type, :address, :longitude, :latitude, :payment_options, :description, :price_range, :image, cuisine_type_ids: [])
	end
end
