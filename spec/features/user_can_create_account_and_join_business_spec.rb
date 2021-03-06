require 'rails_helper'

RSpec.feature "user can create account from home" do
  scenario "Unregistered user creates account and creates business" do
    businesses = create_list(:business, 2)
    humans = create_list(:human, 30)
    role = create_roles[0]
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
      click_button "Submit"
    end

    user = User.find_by(username: 'jlawlz')

    expect(current_path).to eq dashboard_path

    expect(page).to have_content "Jordan"
    expect(page).to_not have_content "Login"
    expect(page).to have_content "Logout"
    expect(page).to have_content "Create a Business"
    expect(page).to have_content "Join an Existing Business"

    click_link "Join an Existing Business"

    expect(current_path).to eq businesses_path

    expect(page).to have_content "#{businesses[0].name}"
    expect(page).to have_content "#{businesses[1].name}"

    click_button "Join #{businesses[0].name}"

    expect(current_path).to eq admin_business_path(businesses[0].url, businesses[0].id)
    expect(page).to have_content "#{businesses[0].name}"
    expect(page).to_not have_content "#{businesses[1].name}"

    expect(page).to have_content "Jordan"
  end

  scenario "is redirected to create account page if username already exists" do
    user = create(:user)

    visit new_user_path

    fill_in "First Name:", with: "Justin"
    fill_in "Last Name:", with: "Lawlerz"
    fill_in "Username:", with: user.username
    fill_in "Password:", with: "password1"
    fill_in "Password Confirmation", with: "password1"

    within "form#new_user" do
      click_button "Submit"
    end

    expect(current_path).to eq new_user_path
    expect(page).to have_content "Username has already been taken"
  end
end
