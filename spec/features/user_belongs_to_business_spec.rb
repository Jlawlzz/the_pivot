require 'rails_helper'

RSpec.feature "business admin belongs to a business" do
  scenario "registered has current business updated if they go from one to another" do

    roles = create_roles

    user = User.create(first_name:"charissa", last_name:"lawrence", username:"claw", password:"password", password_confirmation:"password")
    business1 = Business.create(name:"Robot World", status: "active")
    business2 = Business.create(name:"Machine USA", status: "active")

    UserRole.create(user_id: user.id, role_id: roles[0].id)
    UserRole.create(business_id: business1.id, user_id: user.id, role_id: roles[1].id)
    UserRole.create(business_id: business2.id, user_id: user.id, role_id: roles[1].id)

    user.businesses << business1
    user.businesses << business2

    login(user)

    visit dashboard_path

    expect(page).to have_content "Robot World"
    expect(page).to have_content "Machine USA"

    first(:link, "Bid Now").click
    expect(current_path).to eq auctions_path
    expect(page).to have_content "Currently Bidding For: #{business1.name}"
    expect(page).to_not have_content "#{business2.name}"

  end
end
