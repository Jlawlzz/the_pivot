class AddStatusToBusinesses < ActiveRecord::Migration
  def change
    add_column :businesses, :status, :string, default: "pending"
  end
end
