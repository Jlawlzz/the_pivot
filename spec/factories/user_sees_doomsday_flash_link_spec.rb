# require 'rails_helper'
#
# RSpec.feature "doomsday flash message is shown" do
#   scenario "user who has spent greater than $500 is shown doomsday flash message" do
#     travesty = create_list(:travesty_with_items, 4)
#     user = create(:user)
#     ApplicationController.any_instance.stub(:current_user).and_return(user)
#
#     visit items_path
#     first(:button, 'Add to cart').click
#     first(:button, 'Add to cart').click
#     first(:button, 'Add to cart').click
#
#     visit cart_path
#
#     click_on "Checkout"
#
#     expect(current_path).to eq orders_path
#
#     expect(page).to have_content("Doomsday Hath Commeth:")
#   end
# end
