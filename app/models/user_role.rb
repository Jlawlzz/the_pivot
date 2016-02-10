class UserRole < ActiveRecord::Base
  belongs_to :user
  belongs_to :role

  def initialize(params = nil)
    super
    self.role_id = Role.find_by(name: "registered_user").id unless self.role_id
  end
end
