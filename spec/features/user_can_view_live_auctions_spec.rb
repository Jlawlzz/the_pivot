require 'rails_helper'

RSpec.feature "user can view live auction" do
  scenario "Unregistered user sees humans on auctions page" do

    humans = create_list(:human, 2)
    human1 = humans[0]
    human2 = humans[1]

    auction1 = Auction.new
    auction2 = Auction.new
    auction1.human = human1
    auction2.human = human2
    auction1.save
    auction2.save

    visit auctions_path
    expect(page).to have_content(human1.scum_name)

    expect(page).to have_content(human2.scum_name)

  end

end
