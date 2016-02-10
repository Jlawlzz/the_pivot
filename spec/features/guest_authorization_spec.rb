require 'rails_helper'

RSpec.feature "guest authorizations" do
  scenario "guest is redirected to root path and sees flash message when not authorized" do
    auction = create(:auction)
    business = create(:business)
    user = create(:user)

    visit dashboard_path
    # save_and_open_page
    expect(page).to have_content("You do not have that level of access")
    expect(current_path).to be(root_path)

    visit doomsday_path
    expect(page).to have_content("You do not have that level of access")
    expect(current_path).to be(root_path)

    visit declare_winner_path(auction)
    expect(page).to have_content("You do not have that level of access")
    expect(current_path).to be(root_path)

    visit live_auctions_path
    expect(page).to have_content("You do not have that level of access")
    expect(current_path).to be(root_path)

    visit auction_path(auction)
    expect(page).to have_content("You do not have that level of access")
    expect(current_path).to be(root_path)

    visit admin_business(business)
    expect(page).to have_content("You do not have that level of access")
    expect(current_path).to be(root_path)

    visit edit_user_path(user)
    expect(page).to have_content("You do not have that level of access")
    expect(current_path).to be(root_path)

    visit new_business_path
    expect(page).to have_content("You do not have that level of access")
    expect(current_path).to be(root_path)

    visit business_path(business, business.id)
    expect(page).to have_content("You do not have that level of access")
    expect(current_path).to be(root_path)
  end
end
