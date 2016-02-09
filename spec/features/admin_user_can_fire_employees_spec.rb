require 'rails_helper'

RSpec.feature "admin user can fire employees" do
  scenario "admin can fire a human and human appears back on the auction page" do

    business = create(:business_with_humans)
    admin = User.create(first_name: "Admin",
                        last_name: "guy",
                        username: "admin",
                        password: "password",
                        role: 1)

    business.users << admin
    login(admin)

    humans = [Human.first, Human.last]

    visit business_path(business, business.id)

    expect(page).to have_content("#{Human.first.name}")
    expect(page).to have_content("#{Human.last.name}")

    click_on "#{human.first.name}"
  end
end
