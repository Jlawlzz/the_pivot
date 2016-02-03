# require 'rails_helper'
#
# RSpec.feature "Admin can login" do
#   scenario "Admin user is redirected to admin dashboard when logging in" do
#     admin = create(:user, role: 1)
#
#     visit login_path
#     fill_in "Username", with: admin.username
#     fill_in "Password", with: admin.password
#     click_button "Sign In"
#
#     expect(current_path).to eq admin_dashboard_path
#     expect(page).to have_content "Admin Dashboard"
#   end
#
#   scenario "User redirected to login with incorrect password flash when logging in with wrong password" do
#     admin = User.create(first_name: "mister",
#                         last_name: "admin",
#                         username: "admin",
#                         password: "admin",
#                         role: 1)
#
#     visit login_path
#
#     fill_in "Username", with: admin.username
#     fill_in "Password", with: "sldkfej"
#
#     click_button "Sign In"
#
#     expect(current_path).to eq login_path
#     expect(page).to_not have_content "Admin Dashboard"
#     expect(page).to have_content "Username or password incorrect."
#   end
#
#   scenario "default user does not see admin dashboard when logging in" do
#     user = create(:user)
#
#     visit login_path
#     fill_in "Username", with: user.username
#     fill_in "Password", with: user.password
#     click_button "Sign In"
#
#     expect(current_path).to_not eq admin_dashboard_path
#     expect(current_path).to eq dashboard_path
#     expect(page).to_not have_content "Admin Dashboard"
#   end
#
#   scenario "can navigate to dashboard from link on top left" do
#     admin = create(:user, role: 1)
#
#     visit login_path
#     fill_in "Username", with: admin.username
#     fill_in "Password", with: admin.password
#     click_button "Sign In"
#     click_link "Logged in as #{admin.first_name}"
#
#     expect(current_path).to eq admin_dashboard_path
#     expect(page).to have_content "Admin Dashboard"
#   end
# end
