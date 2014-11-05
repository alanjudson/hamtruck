class Truck < ActiveRecord::Base

  has_many :reviews, dependent: :destroy

  geocoded_by :address
  after_validation :geocode, :reverse_geocode,
  :if => lambda{ |obj| obj.address_changed? }

  validates :name, :cuisine_type, presence: true
  validates :image_file_name, allow_blank: true, format: {
		with: /\w+\.(gif|jpg|png)\z/i,
		message: "must reference a GIF, JPG, or PNG image"
	}


  def display_reviews
    reviews.order("created_at desc").limit(5)
  end
end
