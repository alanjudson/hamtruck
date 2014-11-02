require 'spec_helper'

describe "Navigating projects" do

  it "allows navigation from the detail page to the listing page" do
  	# Arrange the data
  	truck = Truck.create(truck_attributes)

  	visit truck_url(truck)

  	click_on "All Trucks"

  	expect(current_path).to eq(trucks_path)
  end

  it "allows navigation from the listing page to the detail page" do
	truck = Truck.create(truck_attributes)

	visit trucks_url

	click_on truck.name

	expect(current_path).to eq(truck_path(truck))
  end

end