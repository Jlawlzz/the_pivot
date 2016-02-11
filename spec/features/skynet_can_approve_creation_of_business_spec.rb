require 'rails_helper'

RSpec.feature "skynet approves creation of business" do
  scenario "skynet can approve the creation of a new business on his dashboard and then the business is moved to the active list" do
    skynet = User.create(first_name: "skynet",
    last_name: "robot",
    username: "admin",
    password: "password")
    roles = create_roles
    UserRole.create(user_id: skynet.id, role_id: roles[2].id)
    business = create(:business)
    login(skynet)

    expect(current_path).to eq(skynet_dashboard_path)
    expect(page).to have_content("#{business.name}")
    expect(page).to have_link("Approve")

    click_on "Approve"

    expect(current_path).to eq(skynet_dashboard_path)

    within("#active") do
      expect(page).to have_content("#{business.name}")
    end
  end
end
