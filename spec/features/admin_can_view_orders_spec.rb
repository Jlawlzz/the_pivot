# require 'rails_helper'
# include ActionView::Helpers::NumberHelper
#
# RSpec.feature "admin can view all orders" do
# 	scenario "and make changes to order status" do
# 		user = create(:user)
# 		order_1 = create(:order, user_id: user.id, status: "ordered")
# 		order_2 = create(:order, user_id: user.id, status: "ordered")
# 		order_3 = create(:order, user_id: user.id, status: "paid")
# 		admin = create(:user, role: 1)
#
# 		ApplicationController.any_instance.stub(:current_user).and_return(admin)
#
# 		visit admin_orders_path
#
# 		expect(page).to have_content order_1.status.capitalize
# 		expect(page).to have_content number_to_currency(order_1.total_price)
# 		expect(page).to have_content order_3.status.capitalize
#
# 		expect(page).to have_link("Order ##{"%07d" % order_1.id.to_s}", order_path(order_1))
# 		expect(page).to have_link("Order ##{"%07d" % order_2.id.to_s}", order_path(order_2))
# 		expect(page).to have_link("Order ##{"%07d" % order_3.id.to_s}", order_path(order_3))
#
# 		within "div#ordered" do
# 			expect(page).to have_content 2
# 		end
# 		within "div#completed" do
# 			expect(page).to have_content 0
# 		end
# 		within "div#cancelled" do
# 			expect(page).to have_content 0
# 		end
# 		within "div#paid" do
# 			expect(page).to have_content 1
# 		end
#
# 		within "tr##{order_1.id}" do
# 			expect(page).to have_link("Cancel")
# 			expect(page).to have_link("Mark as paid")
# 			expect(page).to_not have_link("Mark as completed")
# 			click_on "Cancel"
# 		end
#
# 		expect(order_1.reload.status).to eq "cancelled"
#
# 		within "tr##{order_2.id}" do
# 			expect(page).to have_link("Cancel")
# 			expect(page).to have_link("Mark as paid")
# 			expect(page).to_not have_link("Mark as completed")
# 			click_on "Mark as paid"
# 		end
#
# 		expect(order_2.reload.status).to eq "paid"
# 		expect(current_path).to eq admin_orders_path
#
# 		within "tr##{order_2.id}" do
# 			expect(page).to have_link("Cancel")
# 			expect(page).to_not have_link("Mark as paid")
# 			expect(page).to have_link("Mark as completed")
# 			click_on "Mark as completed"
# 		end
#
# 		expect(order_2.reload.status).to eq "completed"
# 		expect(current_path).to eq admin_orders_path
#
# 		within "tr##{order_2.id}" do
# 			expect(page).to_not have_link("Cancel")
# 			expect(page).to_not have_link("Mark as paid")
# 			expect(page).to_not have_link("Mark as completed")
# 		end
#
# 		within "tr##{order_3.id}" do
# 			click_on "Cancel"
# 		end
#
# 		expect(order_3.reload.status).to eq "cancelled"
#
# 		within "div#ordered" do
# 			expect(page).to have_content 0
# 		end
# 		within "div#completed" do
# 			expect(page).to have_content 1
# 		end
# 		within "div#cancelled" do
# 			expect(page).to have_content 2
# 		end
# 		within "div#paid" do
# 			expect(page).to have_content 0
# 		end
# 	end
# end
