class User < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  geocoded_by :ip_address,
  :latitude => :lat, :longitude => :lon
  after_validation :geocode

  has_many :reviews, dependent: :destroy
  has_many :follows, dependent: :destroy
  has_many :trucks_followed, through: :follows, source: :truck

  has_secure_password

  validates :name, presence: true
  validates :email, presence: true,
                  format: /\A\S+@\S+\z/,
                  uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6, allow_blank: true }
  validates :username, presence: true,
                     format: /\A[A-Z0-9]+\z/i,
                     uniqueness: { case_sensitive: false },
                     length: { maximum: 25 }

	def gravatar_id
	  Digest::MD5::hexdigest(email.downcase)
	end
  def self.authenticate(email,password)
    user = User.find_by(email: email)
    user && user.authenticate(password)
  end
end
