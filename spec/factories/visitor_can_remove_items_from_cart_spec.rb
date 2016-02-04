# require 'rails_helper'
#
# RSpec.feature "visitor can remove items from cart" do
#   scenario "cart shows no items in cart after removal" do
#     travesties = create_list(:travesty_with_items, 1)
#     items = (item_1, item_2, item_3, item_4 = travesties[0].items)
#
#     visit '/items'
#
#     first(:button, 'Add to cart').click
#
#     expect(page).to have_content("My Cart: 1")
#     expect(page).to have_content("You have 1 item in your cart.")
#
#     visit '/cart'
#
#     first(:link, "Remove").click
#
#     expect(current_path).to eq(cart_path)
#     find_link(item_1.title).visible?
#     expect(page).to have_content("Successfully removed #{item_1.title} from your cart.")
#     expect(page).to have_css(".flash_green_card")
#     expect(page).to_not have_content("My Cart: 1")
#     expect(page).to have_content("My Cart: 0")
#   end
# end
