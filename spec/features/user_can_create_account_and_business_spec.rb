require 'rails_helper'

RSpec.feature "user can create account from home" do
  scenario "Unregistered user creates account and creates business" do

    humans = create_list(:human, 30)

    visit '/'

    expect(page).to have_content("Login")

    click_link "Create Account"

    expect(current_path).to eq new_user_path

    fill_in "First Name:", with: "Jordan"
    fill_in "Last Name:", with: "Lawler"
    fill_in "Username:", with: "jlawlz"
    fill_in "Password:", with: "password"
    fill_in "Password Confirmation", with: "password"

    within "form#new_user" do
      click_button "Create"
    end

    user = User.find_by(username: 'jlawlz')

    expect(current_path).to eq dashboard_path

    expect(page).to have_content "Jordan"
    expect(page).to_not have_content "Login"
    expect(page).to have_content "Logout"
    expect(page).to have_content "Create a Business"
    expect(page).to have_content "Join an Existing Business"

    # within "form#new_user" do
      click_link "Create a Business"
    # end
    expect(current_path).to eq new_business_path

    fill_in "Business Name:", with: "Hastalavista"
    fill_in "Description:", with: "You won't hate working for us... as much"
    click_button "Submit"
    
    business = Business.last
    expect(current_path).to eq admin_business_path(business)
    expect(page).to have_content "Hastalavista"

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
