require 'rails_helper'

RSpec.feature "user can create account from home" do
  scenario "I see my dashboard" do
    roles = create_roles

    create_roles

    visit '/'

    expect(page).to have_content("Login")

    click_link "Create Account"
    fill_in "First Name:", with: "Jordan"
    fill_in "Last Name:", with: "Lawler"
    fill_in "Username:", with: "jlawlz"
    fill_in "Password:", with: "password"
    fill_in "Password Confirmation", with: "password"
    click_on "Submit"

    user = User.find_by(username: 'jlawlz')
    UserRole.create(user_id: user.id, role_id: roles[0].id)

    expect(current_path).to eq dashboard_path

    expect(page).to have_content "Jordan"
    expect(page).to_not have_content "Login"
    expect(page).to have_content "Logout"
  end
end
