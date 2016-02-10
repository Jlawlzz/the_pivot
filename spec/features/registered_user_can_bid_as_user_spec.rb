require 'rails_helper'

RSpec.feature "registered user has option to bid as user" do
  scenario "bid option is available" do

    roles = create_roles

    b1 = Business.create(name:"Porta Potty", description:"We clean up after nasty humans")
    user1 = create(:user)
    user1.businesses << b1
    UserRole.create(user_id: user1.id, role_id: roles[1].id, business_id: b1.id)

    login(user1)

    visit dashboard_path

    within("#user") do
      expect(page).to have_content("Bid")
    end

  end

end
