# require 'rails_helper'
# include ActionView::Helpers::NumberHelper
#
# RSpec.feature "user can view past orders" do
#   scenario "through the order show page" do
#     user = create(:user)
#     travesty = create(:travesty_with_items)
#     item = travesty.items.first
#     order = create(:order, user_id: user.id)
#     order_item = create(:order_item, order_id: order.id, item_id: item.id)
#
#     ApplicationController.any_instance.stub(:current_user).and_return(user)
#
#     visit orders_path
#
#     expect(page).to have_content "Past Orders"
#     expect(page).to have_link("Order ##{"%07d" % order.id.to_s}", href: order_path(order))
#
#     click_link("Order ##{"%07d" % order.id.to_s}")
#
#     expect(current_path).to eq order_path(order)
#     expect(page).to have_content item.title
#     expect(page).to have_content order_item.item_quantity
#     expect(page).to have_content number_to_currency(order_item.item_quantity.to_i * order_item.item_price.to_i)
#     expect(page).to have_content order.status.capitalize
#     expect(page).to have_content number_to_currency(order.total_price)
#     expect(page).to have_content order.created_at
#
#     timestamp_before_update = order.updated_at
#     order.status = "completed"
#     order.save
#     timestamp_after_update = order.updated_at
#
#     visit current_path
#
#     expect(page).to have_content timestamp_after_update
#   end
#
#   scenario "authenticated user cannot see other users orders" do
#     user_1 = create(:user)
#     user_2 = create(:user)
#     travesty = create(:travesty_with_items)
#     item_1, item_2, item_3, item_4 = travesty.items
#     order_1 = create(:order, user_id: user_1.id)
#     order_2 = create(:order, user_id: user_1.id)
#     order_3 = create(:order, user_id: user_2.id, status: "completed", total_price: 10000)
#
#     ApplicationController.any_instance.stub(:current_user).and_return(user_1)
#
#     visit orders_path
#
#     expect(current_path).to eq orders_path
#     expect(page).to have_content order_1.status
#     expect(page).to have_content number_to_currency(order_1.total_price)
#     expect(page).to have_content order_2.status.capitalize
#     expect(page).to have_content number_to_currency(order_2.total_price)
#     expect(page).to_not have_content order_3.status.capitalize
#     expect(page).to_not have_content number_to_currency(order_3.total_price)
#   end
# end
