require 'rails_helper'

RSpec.feature "business admin user authorizations" do
  scenario "business admin is redirected to root path and sees flash message when not authorized" do
    auction = create(:auction)
    business = create(:business)
    user = create(:user)

    visit skynet_dashboard_path(user)
    expect(page).to have_content("You do not have that level of access")
    expect(current_path).to eq(root_path)

  end
end
