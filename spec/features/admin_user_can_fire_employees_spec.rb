require 'rails_helper'

RSpec.feature "admin user can fire employees" do
  scenario "admin can fire a human and human appears back on the auction page" do

    business = create(:business)

    3.times do |t|
      business.humans << create(:human)
    end

    admin = User.create(first_name: "Admin",
                        last_name: "guy",
                        username: "admin",
                        password: "password",
                        role: 1)

    business.users << admin
    login(admin)

    humans = [Human.first, Human.last]

    visit admin_business_path(business.url, business.id)

    expect(page).to have_content("#{humans[0].scum_name}")
    expect(page).to have_content("#{humans[1].scum_name}")

    click_link "Decomission #{humans[0].scum_name}!"

    expect(current_path).to eq admin_business_path(business.url, business.id)
    expect(page).to have_content("#{humans[1].scum_name}")
    expect(page).to_not have_content("#{humans[0].scum_name}")

    visit auctions_path
    expect(page).to have_content("#{humans[0].scum_name}")
    expect(page).to have_content("Current Bid: $0")
  end
end
