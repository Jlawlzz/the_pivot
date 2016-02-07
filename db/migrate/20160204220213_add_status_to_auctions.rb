class AddStatusToAuctions < ActiveRecord::Migration
  def change
    add_column :auctions, :status, :string, default: "live"
  end
end
