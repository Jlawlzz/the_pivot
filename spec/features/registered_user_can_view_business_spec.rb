require 'rails_helper'

RSpec.feature "registered user can view business page" do
  scenario "business admin sees current employees" do
    human = create(:human)
    auction = Auction.create(human_id: human.id)
    business = create(:business)
    roles = create_roles
    business.auctions << auction

    admin = User.create(first_name: "jordan",
                        last_name: "guy",
                        username: "admin",
                        password: "password",
                        role: 1)

    admin.user_roles << UserRole.create(business_id: business.id, role_id: roles[1].id)
    admin.user_roles << UserRole.create(role_id: roles[0].id)
    business.users << admin

    login(admin)

    visit business_path(business.url, business.id)

    expect(page).to have_content "#{human.scum_name}"
  end
end
