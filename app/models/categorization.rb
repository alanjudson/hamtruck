class Categorization < ActiveRecord::Base
  belongs_to :truck
  belongs_to :cuisine_type
end
