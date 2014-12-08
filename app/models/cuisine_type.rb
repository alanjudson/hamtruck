class CuisineType < ActiveRecord::Base
	has_many :categorizations, dependent: :destroy
	has_many :trucks, through: :categorizations
	validates :name, presence: true, uniqueness: true
end
