module TrucksHelper
	def address_state(truck)
		if truck.address.blank?
			content_tag(:p, "Not Updated.")
		else
			truck.address
		end
	end

	def address_status(truck)
		if truck.address.blank?
			content_tag(:p, "Let's put something amazing here!")
		else
			render 'trucks/address'
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
