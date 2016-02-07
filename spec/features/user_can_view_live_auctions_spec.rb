require 'rails_helper'

RSpec.feature "user can view live auction" do
  scenario "Unregistered user sees humans on auctions page" do

    human1 = Human.create(scum_name:"Barry" , bio:"work work work work work" , url:"http://www.humansfordogs.com/wp-content/uploads/2010/03/6a00d8341c153053ef012876a0b6c5970c-pi.jpeg")
    human2 = Human.create(scum_name:"Lisa" , bio:"work work work work work" , url:"http://exit78.com/wp-content/uploads//2009/08/eyes_of_the_great_depression_035.jpg")

    auction1 = Auction.new
    auction2 = Auction.new
    auction1.human = human1
    auction2.human = human2
    auction1.save
    auction2.save

    visit auctions_path
    expect(page).to have_content("Barry")
    # expect(page).to have_css("img[src*='http://www.humansfordogs.com/wp-content/uploads/2010/03/6a00d8341c153053ef012876a0b6c5970c-pi.jpeg']")

    expect(page).to have_content("Lisa")
    # expect(page).to have_css("img[src*='http://exit78.com/wp-content/uploads//2009/08/eyes_of_the_great_depression_035.jpg']")

  end

end
