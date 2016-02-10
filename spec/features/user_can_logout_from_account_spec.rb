require 'rails_helper'

RSpec.feature "user can logout account from navbar" do
  scenario "I see home page" do
    roles = create_roles
    user = create(:user)
    UserRole.create(user_id: user.id, role_id: roles[0].id)

    roles = create_roles

    user = create(:user)

    UserRole.create(user_id: user.id, role_id: roles[0].id)

    visit '/'
    click_link "Login"

    expect(current_path).to eq login_path

    fill_in "Username", with: user.username
    fill_in "Password", with: user.password
    click_button "Sign In"

    expect(current_path).to eq dashboard_path
    expect(page).to have_content "Logged in as #{user.first_name}"
    expect(page).to_not have_content "Login"

    click_link "Logout"

    expect(current_path).to eq '/'
    expect(page).to have_content "Login"
    expect(page).to_not have_content "Logout"
  end
end
