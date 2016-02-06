require 'rails_helper'

RSpec.feature "user can login account from home" do
  scenario "I see my dashboard" do
    user = create(:user)

    visit '/'

    click_link "Login"

    expect(current_path).to eq login_path

    fill_in "Username", with: user.username
    fill_in "Password", with: user.password

    click_button "Sign In"

    expect(current_path).to eq dashboard_path

    expect(page).to have_content "Logged in as #{user.first_name}"
    expect(page).to_not have_content "Login"
    expect(page).to have_content "Logout"
  end
  
  scenario "I get redirected if my credentials are not correct" do
    user = create(:user)
    dummy_incorrect_value = "wrong"

    visit '/login'
    fill_in "Username", with: user.username
    fill_in "Password", with: dummy_incorrect_value

    click_button "Sign In"

    expect(current_path).to eq '/login'
    expect(page).to have_content "Username or password incorrect."

    fill_in "Username", with: dummy_incorrect_value
    fill_in "Password", with: user.username
    click_button "Sign In"

    expect(page).to have_content "Username or password incorrect."
    expect(current_path).to eq '/login'

    fill_in "Username", with: dummy_incorrect_value
    fill_in "Password", with: dummy_incorrect_value
    click_button "Sign In"

    expect(page).to have_content "Username or password incorrect."
    expect(current_path).to eq '/login'
  end
end
