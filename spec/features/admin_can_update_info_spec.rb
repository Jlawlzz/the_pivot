require 'rails_helper'

RSpec.feature "admin user can edit personal details" do
  scenario "admin can edit personal details and see changes on dashboard" do

    admin = User.create(first_name: "Admin",
                        last_name: "guy",
                        username: "admin",
                        password: "password",
                        role: 1)

    login(admin)

    visit dashboard_path

    expect(page).to have_content("Admin")
    expect(page).to have_content("admin")

    click_on "Edit Profile"

    expect(current_path).to eq edit_user_path(admin)

    fill_in "First Name:", with: "Jordan"
    fill_in "Last Name:", with: "Lawler"
    fill_in "Username:", with: "jlawlz"
    fill_in "Password:", with: "password"
    fill_in "Password Confirmation", with: "password"

    click_on "Submit"

    expect(page).to have_content("Jordan")
    expect(page).to_not have_content("Admin")
    expect(page).to have_content("jlawlz")
    expect(page).to_not have_content("admin")
  end
end
