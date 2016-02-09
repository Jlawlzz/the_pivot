class AddImagesUrlToHumans < ActiveRecord::Migration
  def change
    add_column :humans, :url, :string
  end
end
