class CreateWinningBids < ActiveRecord::Migration
  def change
    create_table :winning_bids do |t|
      t.references :bid, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
