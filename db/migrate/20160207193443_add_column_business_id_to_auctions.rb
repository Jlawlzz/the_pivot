class AddColumnBusinessIdToAuctions < ActiveRecord::Migration
  def change
    add_reference :auctions, :business, index: true, foreign_key: true
  end
end
