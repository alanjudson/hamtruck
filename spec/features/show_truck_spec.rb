require 'spec_helper'

describe "Viewing an individual project" do

  it "shows the project's details" do
  	# Arrange the data
  	truck = Truck.create(truck_attributes)
  	# Action to take
  	visit truck_url(truck.id)

  	expect(page).to have_text(truck.name)
  	expect(page).to have_text(truck.cuisine_type)
  end

  it "shows the address if address is filled in" do
  	truck = Truck.create(truck_attributes(address: "Hamilton"))

  	visit truck_url(truck)

  	expect(page).to have_text("Hamilton")
  end

  it "shows 'Not Updated' of the address is blank" do
  	truck = Truck.create(truck_attributes(address: nil))

  	visit truck_url(truck)

  	expect(page).to have_text("Not Updated")
  end
end