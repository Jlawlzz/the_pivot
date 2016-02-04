class Business < ActiveRecord::Base

  has_many :business_users
  has_many :users, through: :business_users

end
