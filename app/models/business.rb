class Business < ActiveRecord::Base
  has_many :business_users
  has_many :users, through: :business_users

  validates :url, presence: true, uniqueness: true
  validates :name, presence: true 

  before_validation :generate_url

  def generate_url
    self.url = name.parameterize
  end
end
