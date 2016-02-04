# require 'rails_helper'
#
# RSpec.feature "User can create a review for an item" do
#   scenario "User is taken back to item after creating a review for it" do
#     travesty = create(:travesty_with_items)
#     item = travesty.items.first
#     user = create(:user)
#     text = "Test Review"
#
#     ApplicationController.any_instance.stub(:current_user).and_return(user)
#
#     visit item_path(item)
#
#     click_on "Add Review"
#
#     expect(current_path).to eq new_item_review_path(item)
#     fill_in "Text", with: text
#     fill_in "Stars", with: 5
#     click_on "Create Review"
#
#     expect(page).to have_content(user.username)
#     expect(page).to have_content(text)
#     expect(page).to have_content(5)
#   end
#
#   scenario "user can see all their reviews on their dashboard" do
#     travesty = create(:travesty_with_items)
#     item = travesty.items.first
#     user = create(:user)
#
#     review = Review.create(text: "Test Review", stars: 3)
#     item.reviews << review
#     user.reviews << review
#
#     visit login_path
#
#     fill_in "Username", with: user.username
#     fill_in "Password", with: user.password
#     click_on "Sign In"
#
#     expect(current_path).to eq dashboard_path
#     expect(page).to have_content(review.text)
#     expect(page).to have_content(review.stars)
#   end
# end
