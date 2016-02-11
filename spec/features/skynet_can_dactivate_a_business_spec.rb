require 'rails_helper'

RSpec.feature "skynet deactivates a business" do
  scenario "skynet can deactivate a business and it moves to the 'deactiated' list of businesses with an 'activate' button" do
    skynet = User.create(first_name: "skynet",
    last_name: "robot",
    username: "admin",
    password: "password")
    roles = create_roles
    UserRole.create(user_id: skynet.id, role_id: roles[2].id)
    business1 = create(:business, status: "active")
    business2 = create(:business)
    business3 = create(:business, status: "inactive")

    login(skynet)

    expect(current_path).to eq(skynet_dashboard_path)
    expect(page).to have_content("#{business1.name}")
    expect(page).to have_content("#{business2.name}")
    expect(page).to have_content("#{business3.name}")
    expect(page).to have_link("Deactivate")

    click_on "Deactivate"

    expect(page).not_to have_link("Deactivate")
  end
end
