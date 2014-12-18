class Truck < ActiveRecord::Base

  has_many :reviews, dependent: :destroy
  has_many :follows, dependent: :destroy
  # go through the follows association and get users, but call them fans
  has_many :fans, through: :follows, source: :user
  has_many :categorizations, dependent: :destroy
  has_many :cuisine_types, through: :categorizations
  has_attached_file :image

  geocoded_by :address
  after_validation :geocode,
  :if => lambda{ |obj| obj.address_changed? }


  validates_attachment :image,
    :content_type => { :content_type => ['image/jpeg','image/png'] },
    :size => { :less_than => 1.megabyte }
  PAYMENT_OPTIONS = ["Cash, Credit, Interac, PayPal"]

  scope :past, -> { where('updated_at < ?', Time.now).order('updated_at asc') } 
  scope :popular, -> { all.sort { |a, b| a.fans.count <=> b.fans.count } }
  
  
  def display_reviews
    reviews.order("created_at desc").limit(5)
  end
end
