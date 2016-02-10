require 'rails_helper'

RSpec.feature "registered user authorizations" do
  scenario "registered user is redirected to root path and sees flash message when not authorized" do
    auction = create(:auction)
    business = create(:business)
    user = create(:user)

    visit doomsday_path
    expect(page).to have_content("You do not have that level of access")
    expect(current_path).to be(root_path)

    visit users_path
    expect(page).to have_content("You do not have that level of access")
    expect(current_path).to be(root_path)

    visit edit_user_path(user)
    expect(page).to have_content("You do not have that level of access")
    expect(current_path).to be(root_path)

    visit declare_winner_path(auction)
    expect(page).to have_content("You do not have that level of access")
    expect(current_path).to be(root_path)

    visit admin_business(business)
    expect(page).to have_content("You do not have that level of access")
    expect(current_path).to be(root_path)

  end
end
