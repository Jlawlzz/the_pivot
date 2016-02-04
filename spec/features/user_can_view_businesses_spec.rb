require 'rails_helper'

RSpec.feature "user can view businesses" do
  scenario "Unregistered user can view business index and individual business" do
    # As a unregistered User,
    # When I visit the home page,
    # I see a link for "Hire Humans",
    # I can click on "View Businesses",
    # I am redirected to the business index,
    # And I can click on a business and view it's show page,
    # The page has the business name and the humans that work for them
    visit '/'

    expect(page).to have_content("View Humans for Hire")
    expect(page).to have_content("View Businesses")

    click_link "View Businesses"
    expect(current_path).to eq businesses_path

    Business.create(name:"Porta Potty", description:"We clean up after nasty humans", url:"www.google.com")
    Business.create(name:"Robot Shoe Makers", description:"Because metal feet no good for floor", url:"www.google.com")
    Business.humans.create(name:"Human id#12")

    expect(page).to have_content "Porta Potty"
    expect(page).to_not have_content "Robot Shoe Makers"
    click_link "Porta Potty"

    business = Business.find_by(name: "Porta Potty")
    expect(current_path).to eq business_path(business)

    expect(page).to have_content "Porta Potty"
    expect(page).to_not have_content "Robot Shoe Makers"
    expect(page).to have_content "Human id#12"

  end

end
