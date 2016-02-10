require 'rails_helper'

RSpec.feature "multitenancy business name in url path" do
  scenario "business admin visits business dashboard sees business name in url" do
    roles = create_roles
    business = create(:business)
    user = User.create(first_name: "jordan",
                        last_name: "guy",
                        username: "admin",
                        password: "password",
                        role: 1)

    business.users << user
    UserRole.create(business_id: business.id, user_id: user.id, role_id: roles[1].id)
    UserRole.create(user_id: user.id, role_id: roles[0].id)

    login(user)

    visit admin_business_path(business.url, business.id)

    expect(current_path).to eq "/admin/#{business.url}/#{business.id}"
  end

  scenario "non-registered user visits businesses list sees business name in url" do
    business = create(:business)

    visit businesses_path

    expect(current_path).to eq "/businesses"
  end

end
