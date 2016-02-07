class CreateAuctions < ActiveRecord::Migration
  def change
    create_table :auctions do |t|
      t.integer :winning_bid
      t.timestamps null: false
    end
  end
end
