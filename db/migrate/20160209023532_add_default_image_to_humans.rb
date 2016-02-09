class AddDefaultImageToHumans < ActiveRecord::Migration
  def change
    change_column :humans, :url, :string, default: "https://www.ssa.gov/history/pics/woman50.gif"
  end
end
