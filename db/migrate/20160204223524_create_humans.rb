class CreateHumans < ActiveRecord::Migration
  def change
    create_table :humans do |t|
      t.string :scum_name
      t.text :bio

      t.timestamps null: false
    end
  end
end
