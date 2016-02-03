# require 'rails_helper'
#
# RSpec.feature "Admin can delete an item" do
#   scenario "Admin can delete an existing item and is redirected to items index" do
#     admin = create(:user, role: 1)
#     travesty = create(:travesty_with_items)
#     item = travesty.items.first
#
#     ApplicationController.any_instance.stub(:current_user).and_return(admin)
#
#     visit admin_items_path
#
#     expect(page).to have_content item.title
#     expect(page).to have_content item.description
#     expect(page).to have_content item.price
#
#     first(:link, "Delete").click
#
#     expect(page).to_not have_content item.title
#     expect(page).to_not have_content item.description
#     expect(page).to_not have_content item.price
#   end
# end
