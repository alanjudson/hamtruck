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
		if truck.image.exists?
			image_tag truck.image.url
		else
			image_tag 'placeholder.jpeg'
		end
	end
end
