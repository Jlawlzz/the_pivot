class CreateBusinessUsers < ActiveRecord::Migration
  def change
    create_table :business_users do |t|
      t.references :business, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
    end
  end
end
