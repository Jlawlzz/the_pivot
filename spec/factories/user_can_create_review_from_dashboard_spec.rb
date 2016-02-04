# require 'rails_helper'
#
# RSpec.feature "User can create review from dashboard link" do
#   scenario "User is redirected to an items index with add review buttons" do
#     travesty = create(:travesty_with_items)
#     user = create(:user)
#     text = "Test Review"
#     item = Item.all.first
#
#     visit login_path
#     fill_in "Username", with: user.username
#     fill_in "Password", with: user.password
#     click_button "Sign In"
#
#     expect(current_path).to eq dashboard_path
#
#     visit new_item_review_path(item)
#
#     fill_in "Text", with: text
#     fill_in "Stars", with: 5
#     click_on "Create Review"
#
#     expect(current_path).to eq item_path(item)
#     expect(page).to have_content(text)
#     expect(page).to have_content(5)
#   end
#
# end
