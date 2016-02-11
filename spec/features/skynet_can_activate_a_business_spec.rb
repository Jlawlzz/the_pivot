require 'rails_helper'

RSpec.feature "skynet business approval, deactivation, and activation" do
  scenario "skynet can approve a new business on his dashboard and then sees the new business as activated and vice versa" do
    skynet = User.create(first_name: "skynet",
    last_name: "robot",
    username: "admin",
    password: "password")
    roles = create_roles
    UserRole.create(user_id: skynet.id, role_id: roles[2].id)
    business = Business.create(name: "We Make Things", description: "Much better", status: "pending")

    login(skynet)

    expect(current_path).to eq(skynet_dashboard_path)
    within("#pending") do
      expect(page).to have_content("#{business.name}")
      expect(page).to have_link("Approve")
    end

    click_on "Approve"

    expect(current_path).to eq(skynet_dashboard_path)

    within("#active") do
      expect(page).to have_content("#{business.name}")
      expect(page).to have_link("Deactivate")
    end

    click_on "Deactivate"

    expect(current_path).to eq(skynet_dashboard_path)

    within("#inactive") do
      expect(page).to have_content("#{business.name}")
      expect(page).to have_link("Activate")
    end

    click_on "Activate"

    within("#active") do
      expect(page).to have_content("#{business.name}")
      expect(page).to have_link("Deactivate")
    end
  end
end
