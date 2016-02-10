require 'rails_helper'

RSpec.feature "skynet business activation" do
  scenario "skynet can activate a new business on his dashboard and then sees the new business as activated and vice versa" do
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
    expect(page).to have_link("Activate")

    click_on "Activate"

    expect(current_path).to eq(skynet_dashboard_path)
    expect(page).to have_content("#{business.name}")
    expect(page).to have_link("Deactivate")

    click_on "Deactivate"

    expect(current_path).to eq(skynet_dashboard_path)
    expect(page).to have_content("#{business.name}")
    expect(page).to have_link("Activate")
  end
end
