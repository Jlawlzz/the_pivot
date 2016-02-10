require 'rails_helper'

RSpec.feature "registered user authorizations" do
  scenario "registered user is redirected to root path and sees flash message when not authorized" do
    auction = Auction.create
    business = create(:business)
    user = create(:user)

    visit doomsday_path
    expect(page).to have_content("You do not have that level of access")
    expect(current_path).to eq(root_path)

    visit edit_user_path(user)
    expect(page).to have_content("You do not have that level of access")
    expect(current_path).to eq(root_path)

    visit admin_business_path(business.url, business.id)
    expect(page).to have_content("You do not have that level of access")
    expect(current_path).to eq(root_path)

  end
end
