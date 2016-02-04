# require 'rails_helper'
#
# RSpec.describe User, type: :model do
# 	it "evaluates total purchased for user" do
# 		user = create(:user)
# 		order_1 = create(:order, user_id: user.id, total_price: 5000)
# 		order_2 = create(:order, user_id: user.id, total_price: 1500)
# 		order_3 = create(:order, user_id: user.id, total_price: 900)
#
# 		expect(user.total_purchased).to eq(7400)
# 	end
# end
