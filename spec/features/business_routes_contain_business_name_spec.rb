require 'rails_helper'

RSpec.feature "admin sees business name in url path" do
  scenario "business admin visits business dashboard sees business name in url" do

    business = create(:business)
    business_admin = User.create(first_name: "jordan",
                        last_name: "guy",
                        username: "admin",
                        password: "password",
                        role: 1)

    business.users << business_admin

    ApplicationController.any_instance.stub(:current_user).and_return(business_admin)

    visit admin_business_path(business.url, business.id)

    expect(current_path).to eq "/admin/#{business.url}/#{business.id}"
  end

end

RSpec.feature "non-registered user sees business name in url path" do
  scenario "non-registered user visits business dashboard sees business name in url" do

    business = create(:business)

    visit business_path(business.url, business.id)

    expect(current_path).to eq "/#{business.url}/#{business.id}"
end
