require 'rails_helper'

RSpec.feature "can't view deactivated business" do
  scenario "business admin can't view a deactivated business" do
    roles = create_roles
    business = Business.create(name: "We Make Things", description: "Much better", status: "inactive")

    admin = User.create(first_name: "jordan",
                        last_name: "guy",
                        username: "admin",
                        password: "password",
                        role: 1)
    UserRole.create(business_id: business.id, user_id: admin.id, role_id: roles[1].id)
    UserRole.create(user_id: admin.id, role_id: roles[0].id)

    business.users << admin

    login(admin)

    expect(page).to have_content("#{business.name}")
    expect(page).to_not have_link "Bid Now"
  end
end
