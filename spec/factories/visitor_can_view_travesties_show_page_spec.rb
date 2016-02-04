# require 'rails_helper'
# include ActionView::Helpers::NumberHelper
#
# RSpec.feature "Visitor navigates to travesty page" do
#   describe "sees expected travesty content" do
#     scenario "when they enter travesty id slug" do
#       travesties = create_list(:travesty_with_items, 2)
#       items = (item_1, item_2, item_3, item_4 = travesties[0].items)
#       items_2 = (item_5, item_6, item_7, item_8 = travesties[1].items)
#
#       visit travesty_path(travesties[0])
#
#       4.times do |t|
#         expect(page).to have_content(items[t].title)
#         expect(page).to have_content(items[t].description)
#         expect(page).to have_content(number_to_currency(items[t].price))
#       end
#
#       visit travesty_path(travesties[1])
#
#       4.times do |t|
#         expect(page).to have_content(items_2[t].title)
#         expect(page).to have_content(items_2[t].description)
#         expect(page).to have_content(number_to_currency(items_2[t].price))
#       end
#     end
#
#     scenario "when they enter friendly travesty slug" do
#       travesties = create_list(:travesty_with_items, 2)
#       items = (item_1, item_2, item_3, item_4 = travesties[0].items)
#       items_2 = (item_5, item_6, item_7, item_8 = travesties[1].items)
#
#       visit "/travesties/#{travesties[0].slug}"
#
#       4.times do |t|
#         expect(page).to have_content(items[t].title)
#         expect(page).to have_content(items[t].description)
#         expect(page).to have_content(number_to_currency(items[t].price))
#       end
#     end
#   end
# end
