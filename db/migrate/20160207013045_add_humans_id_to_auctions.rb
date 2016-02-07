class AddHumansIdToAuctions < ActiveRecord::Migration
  def change
    add_reference :auctions, :human, index: true, foreign_key: true
  end
end
