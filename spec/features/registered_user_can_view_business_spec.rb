require 'rails_helper'

RSpec.feature "registered user can view business page" do
  scenario "registered user sees current employees" do
    # As a registered admin/user,
    # When I visit my businesses page,
    # I can view all the employees we currently have.    user = create(:user)

    user = User.create(first_name:"charissa", last_name:"lawrence", username:"claw", password:"password", password_confirmation:"password")
    human1 = Human.create(scum_name:"ID4343")
    human2 = Human.create(scum_name:"ID5555")

    user.humans << human1
    user.humans << human2

    login(user)

    visit dashboard_path

    expect(page).to have_content "#{human1.scum_name}"
    expect(page).to have_content "#{human2.scum_name}"


  end

end
