class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :user, index: true, foreign_key: true
      t.references :business, index: true, foreign_key: true
      t.integer :voter

      t.timestamps null: false
    end
  end
end
