require 'rails_helper'

RSpec.feature "visitor can view humans" do
  scenario "index displays all current humans for visitor" do

    humans = create_list(:human, 30)

    visit '/'

    expect(page).to have_link("View Businesses")
    expect(page).to have_link("View Humans for Hire")

    click_link "View Humans for Hire"

    expect(current_path).to eq humans_path

    30.times do |t|
      expect(page).to have_content(humans[t].scum_name)
      expect(page).to have_content(humans[t].bio)
    end
  end
end
