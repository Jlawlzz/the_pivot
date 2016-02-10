require 'rails_helper'

RSpec.feature "user can create account from home" do
  scenario "registered has current business updated if they go from one to another" do

    roles = create_roles

    user = User.create(first_name:"charissa", last_name:"lawrence", username:"claw", password:"password", password_confirmation:"password")
    business1 = Business.create(name:"Robot World")
    business2 = Business.create(name:"Machine USA")

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

  # scenario "is redirected to account page if username already exists" do
  #   user = create(:user)
  #
  #   visit new_user_path
  #
  #   fill_in "First Name:", with: "Justin"
  #   fill_in "Last Name:", with: "Lawlerz"
  #   fill_in "Username:", with: user.username
  #   fill_in "Password:", with: "password1"
  #   fill_in "Password Confirmation", with: "password1"
  #
  #   within "form#new_user" do
  #     click_button "Create"
  #   end
  #
  #   expect(current_path).to eq new_user_path
  #   expect(page).to have_content "Username #{user.username} is already taken. Please choose a different username"
  # end
end
