# require 'rails_helper'
#
# RSpec.describe OrderDigest, type: :model do
# 	attr_reader :order_digest
#
# 	before :each do
# 		4.times { create(:order, status: "ordered") }
# 		3.times { create(:order, status: "paid") }
# 		2.times { create(:order, status: "completed") }
# 		1.times { create(:order, status: "cancelled") }
# 		@order_digest = OrderDigest.new
# 	end
#
# 	it "calculates number of orders with status ordered" do
# 		expect(order_digest.ordered).to eq(4)
# 	end
#
# 	it "calculates number of orders with status paid" do
# 		expect(order_digest.paid).to eq(3)
# 	end
#
# 	it "calculates number of orders with status completed" do
# 		expect(order_digest.completed).to eq(2)
# 	end
#
# 	it "calculates number of orders with status cancelled" do
# 		expect(order_digest.cancelled).to eq(1)
# 	end
# end
