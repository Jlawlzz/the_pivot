class AddExpirationDateToAuctions < ActiveRecord::Migration
  def change
    add_column :auctions, :expiration_date, :datetime
  end
end
