module TrucksHelper
	def address_state(truck)
		if truck.address.blank?
			content_tag(:p, "Not Updated.")
		else
			truck.address
		end
	end

	def image_for(truck)
		if truck.image_file_name.blank?
			image_tag 'placeholder.jpeg'
		else
			image_tag truck.image_file_name
		end
	end
end
