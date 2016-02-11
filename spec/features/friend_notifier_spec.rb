require "rails_helper"

RSpec.feature "registered user has option to bid as user" do
  scenario "Unregistered user account creation will send a confirmation email" do
    roles = create_roles
    create_roles
    humans = create_list(:human, 30)

    visit root_path

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

    expect(page).to have_content "Email verification has been sent to the administrator."
    expect(page).to_not have_content "#{user.first_name}'s Profile'"

  end
end
