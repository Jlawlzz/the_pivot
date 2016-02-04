class CreateHuman < ActiveRecord::Migration
  def change
    create_table :humans do |t|
      t.string :scum_name
      t.string :bio
      t.timestamps null: false
    end
  end
end
