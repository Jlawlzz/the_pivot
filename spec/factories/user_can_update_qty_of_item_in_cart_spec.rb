# require 'rails_helper'
# include ActionView::Helpers::NumberHelper
#
# RSpec.feature "visitor can update quantity of items in cart" do
#   scenario "they can add to quantity of item in cart" do
#     travesties = create_list(:travesty_with_items, 2)
#     items = (item_1, item_2, item_3, item_4 = travesties[0].items)
#     items_2 = (item_5, item_6, item_7, item_8 = travesties[1].items)
#
#     visit '/items'
#
#     click_button("#{item_1.id}_add_button")
#
#   	visit '/cart'
#
#   	within "td#item_#{item_1.id}_qty" do
#       expect(find_field('Quantity').value).to eq '1'
#     end
#
#   	within "td#item_#{item_1.id}_line_ttl" do
#       expect(page).to have_content(number_to_currency(item_1.price))
#     end
#   	expect(page).to have_content(number_to_currency(item_1.price))
#
#   	fill_in "Quantity", with: "3"
#     click_button("Update quantity")
#
#   	expect(current_path).to eq('/cart')
#   	within "td#item_#{item_1.id}_qty" do
#       expect(find_field('Quantity').value).to eq '3'
#     end
#   	within "td#item_#{item_1.id}_line_ttl" do
#       expect(page).to have_content(number_to_currency((item_1.price * 3)))
#     end
#     expect(page).to have_content(number_to_currency((item_1.price * 3)))
#
#   	fill_in "Quantity", with: "2"
#     click_button("Update quantity")
#
#   	expect(current_path).to eq('/cart')
#   	within "td#item_#{item_1.id}_qty" do
#       expect(find_field('Quantity').value).to eq '2'
#     end
#   	within "td#item_#{item_1.id}_line_ttl" do
#       expect(page).to have_content(number_to_currency((item_1.price * 2)))
#     end
#     expect(page).to have_content(number_to_currency((item_1.price * 2)))
#   end
# end
