# require 'rails_helper'
#
# RSpec.describe CartItem, type: :model do
#   it "sums line total prices for item in cart" do
# 		travesty = create(:travesty_with_items)
#     item_1 = travesty.items.first
#
# 		cart_item = CartItem.new(item_1.id, 2)
#
#     expect(cart_item.line_total_price).to eq(item_1.price * 2)
#
#     cart_item.qty = 3
#     expect(cart_item.line_total_price).to eq(item_1.price * 3)
#   end
# end
