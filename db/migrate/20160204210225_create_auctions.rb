class CreateAuctions < ActiveRecord::Migration
  def change
    create_table :auctions do |t|
      t.integer :winning_bid
      t.references :human, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
