# require 'rails_helper'
#
# RSpec.feature "admin user can fire admin" do
#   scenario "admin can fire an admin" do
#     roles = create_roles
#     business = create(:business)
#
#     admin1 = User.create(first_name: "Admin",
#                         last_name: "guy",
#                         username: "admin",
#                         password: "password",
#                         role: 1)
#
#     admin2 = User.create(first_name: "Butt",
#                         last_name: "Face",
#                         username: "ButtFace",
#                         password: "password",
#                         role: 1)
#
#
#     admin1.user_roles << UserRole.create(business_id: business.id, role_id: roles[1].id)
#     admin1.user_roles << UserRole.create(role_id: roles[0].id)
#     admin2.user_roles << UserRole.create(business_id: business.id, role_id: roles[1].id)
#     admin2.user_roles << UserRole.create(role_id: roles[0].id)
#
#     business.users << admin1
#     business.users << admin2
#
#     login(admin1)
#
#     visit admin_business_path(business.url, business.id)
#
#     expect(page).to have_content("#{admin1.username}")
#     expect(page).to have_content("#{admin2.username}")
#
#     click_button "Vote to Fire"
#
#     expect(current_path).to eq admin_business_path(business.url, business.id)
#     expect(page).to have_content("#{admin1.username}")
#     expect(page).to_not have_content("#{admin2.username}")
#   end
# end
