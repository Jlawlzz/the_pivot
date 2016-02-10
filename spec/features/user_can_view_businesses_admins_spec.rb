require 'rails_helper'

RSpec.feature "user can view businesses" do
  scenario "registered user can view individual business and its humans" do

    user1 = create(:user)
    human1 = Human.create(scum_name: "ID1212")
    b1 = Business.create(name:"Porta Potty", description:"We clean up after nasty humans")
    b2 = Business.create(name:"Robot Shoe Makers", description:"Because metal feet no good for floor")
    auction1 = Auction.new
    auction1.human = human1
    auction1.save
    b1.auctions << auction1
    roles = create_roles
    UserRole.create(user_id: user1.id, role_id: roles[0].id)
    login(user1)

    visit '/'

    expect(page).to have_content("View Humans for Hire")
    expect(page).to have_content("View Businesses")

    click_link "View Businesses"
    expect(current_path).to eq businesses_path
    expect(page).to have_content "Porta Potty"
    expect(page).to have_content "Robot Shoe Makers"

    click_link "Join Porta Potty"
    expect(current_path).to eq "/admin/porta-potty/#{b1.id}"
    expect(page).to have_content "Porta Potty"
    expect(page).to_not have_content "Robot Shoe Makers"

    expect(page).to have_content "Porta Potty"
    expect(page).to_not have_content "Robot Shoe Makers"
    expect(page).to have_content "ID1212"
  end

end
