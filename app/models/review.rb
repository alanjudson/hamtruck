class Review < ActiveRecord::Base
  belongs_to :truck
  belongs_to :user

  STARS = [1,2,3,4,5]

  validates :comment, length: { minimum: 4 }
  validates :stars, inclusion: {
	  in: STARS,
	  message: "must be between 1 and 5"
	}
end
