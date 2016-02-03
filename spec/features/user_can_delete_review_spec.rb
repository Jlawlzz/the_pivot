# require 'rails_helper'
#
# RSpec.feature "User can delete their own reviews" do
#   scenario "User is redirected back to their dashboard upon deleting their review" do
#     travesty = create(:travesty_with_items)
#     item = travesty.items.first
#     user = create(:user)
#     review = Review.create(text: "Test Review", stars: 5)
#     item.reviews << review
#     user.reviews << review
#
#     visit login_path
#
#     fill_in "Username", with: user.username
#     fill_in "Password", with: user.password
#     click_on "Sign In"
#
#     expect(page).to have_content(review.text)
#     expect(page).to have_content(review.stars)
#
#     click_on "Delete Review"
#
#     expect(page).to_not have_content(review.text)
#     expect(page).to_not have_content(review.stars)
#   end
# end
