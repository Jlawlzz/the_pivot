# require 'rails_helper'
#
# RSpec.feature "user can view retired item" do
#   scenario "but cannot order item" do
#     user = create(:user)
#     ApplicationController.any_instance.stub(:current_user).and_return(user)
#     travesty = create(:travesty_with_items)
#     item = travesty.items.first
#
# 		visit item_path(item)
#
# 		expect(page).to have_button "Add to cart"
#
# 		item.active = false
# 		item.save
# 		visit item_path(item)
#
# 		expect(page).to_not have_button "Add to cart"
#   end
# end
