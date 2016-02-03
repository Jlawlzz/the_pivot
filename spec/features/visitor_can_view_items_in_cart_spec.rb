# require 'rails_helper'
#
# RSpec.feature "visitor can view items in cart" do
#   scenario "they see their cart items" do
#     travesties = create_list(:travesty_with_items, 1)
#     items = (item_1, item_2, item_3, item_4 = travesties[0].items)
#
# 	  visit '/items'
#
#     expect(page).to have_content("My Cart: 0")
#
#     4.times do |t|
#       click_button("#{items[t].id}_add_button")
#     end
#
#     expect(page).to have_content("My Cart: 4")
#
#     click_on "My Cart"
#
#     4.times do |t|
#       expect(page).to have_content(items[t].title)
#       expect(page).to have_content(items[t].description)
#       # expect(page).to have_content(item_1.price)
#       expect(page).to have_css("##{items[t].id}_item")
#     end
#   end
# end
