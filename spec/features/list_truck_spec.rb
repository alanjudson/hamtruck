require 'spec_helper'

describe "Viewing a list of trucks" do
	it "shows the trucks" do

		truck1 = Truck.create(name: "Gorilla Cheese",
		                      cuisine_type: "Grilled Cheese",
		                      address: "",
		                      longitude: "",
		                      latitude: "")

		truck2 = Truck.create(name: "Johnny Blonde",
		                      cuisine_type: "Tapas",
		                      address: "",
		                      longitude: "",
		                      latitude: "")

		truck3 = Truck.create(name: "Southern Comfort",
		                      cuisine_type: "BBQ",
		                      address: "",
		                      longitude: "",
		                      latitude: "")

		visit "http://example.com/trucks"

		expect(page).to have_text("3 Trucks")
		expect(page).to have_text(truck1.name)
		expect(page).to have_text(truck2.name)
		expect(page).to have_text(truck3.name)
	end
end