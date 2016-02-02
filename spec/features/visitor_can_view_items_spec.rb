# require 'rails_helper'
# # include ActionView::Helpers::TextHelper
#
# RSpec.feature "visitor can view items" do
#   scenario "index displays all current items for visitor" do
#     travesties = create_list(:travesty_with_items, 2)
#     items = (item_1, item_2, item_3, item_4 = travesties[0].items)
#     items_2 = (item_5, item_6, item_7, item_8 = travesties[1].items)
#
#     visit '/items'
#     expect(page).to have_content(travesties[0].title)
#     expect(page).to have_content(travesties[1].title)
#
#     4.times do |t|
#       expect(page).to have_content(items[t].title)
#       # expect(page).to have_content(number_to_currency(items[t].price))
#       expect(page).to have_content(items[t].description)
#     end
#
#     4.times do |t|
#       expect(page).to have_content(items_2[t].title)
#       # expect(page).to have_content(number_to_currency(items_2[t].price))
#       expect(page).to have_content(items_2[t].description)
#     end
#   end
# end
