# require 'rails_helper'
# include ActionView::Helpers::NumberHelper
#
# RSpec.feature "visitor can check out with items in cart" do
# 	scenario "with item in cart" do
# 		user = create(:user)
# 		travesty = create(:travesty_with_items)
# 		item_1 = travesty.items.first
# 		item_2 = travesty.items[1]
#
# 		visit item_path(item_1)
# 		first(:button, 'Add to cart').click
# 		visit item_path(item_2)
# 		first(:button, 'Add to cart').click
#
# 		expect(page).to have_content("My Cart: 2")
#
# 		visit '/cart'
# 		click_on 'Checkout'
#
# 		expect(page).to have_content("Please log in to check out")
# 		expect(current_path).to eq login_path
#
# 		fill_in "Username", with: user.username
#     fill_in "Password", with: user.password
#     click_button "Sign In"
#
# 		visit '/cart'
# 		click_on 'Checkout'
#
# 		order = Order.find_by(user_id: user.id)
# 		expect(order.status).to eq "ordered"
# 		expect(current_path).to eq orders_path
# 		expect(page).to have_content("Order was successfully placed")
# 		within "td#order_status" do
# 			expect(page).to have_content order.status
# 		end
# 		within "td#order_total_price" do
# 			expect(page).to have_content number_to_currency(order.total_price)
# 		end
# 		within "td#order_created_at" do
# 			expect(page).to have_content order.created_at
# 		end
# 		expect(page).to have_content("My Cart: 0")
# 	end
# end
