# require 'rails_helper'
#
# RSpec.describe Cart, type: :model do
#   attr_reader :cart, :item_1, :item_2, :travesty
#
#   before :each do
#     @cart = Cart.new(nil)
#     @travesty = create(:travesty_with_items)
#     @item_1, @item_2 = travesty.items[0..1]
#   end
#
#   it "adds new item to cart" do
#     add_one = cart.add_item(item_1.id)
#     count = cart.contents.count
#
#     expect(count).to eq(1)
#   end
#
#   it "increases count of single item in cart" do
#     cart.add_item(item_1.id)
#     count = cart.contents.values.last
#
#     expect(count).to eq(1)
#
#     cart.add_item(item_1.id)
#     count = cart.contents.values.last
#
#     expect(count).to eq(2)
#   end
#
#   it "adds second item to cart" do
#     item_1.update(
#       title: "title",
#       description: "description",
#       price: 10
#     )
#     item_2.update(
#       title: "title_2",
#       description: "description",
#       price: 10
#     )
#
#     cart.add_item(item_1.id)
#     count = cart.contents.count
#
#     expect(count).to eq(1)
#
#     cart.add_item(item_2.id)
#     count = cart.contents.count
#
#     expect(count).to eq(2)
#   end
#
#   it "counts total items in cart" do
#     2.times { cart.add_item(item_1.id) }
#     cart.add_item(item_2.id)
#
#     expect(cart.count_of).to eq(3)
#   end
#
#   it "sums total price all items in cart" do
#     2.times { cart.add_item(item_1.id) }
#     cart.add_item(item_2.id)
#
#     expect(cart.total_price).to eq((item_1.price * 2) + (item_2.price))
#   end
#
#   it "evaluates total price as zero if cart is empty" do
#     expect(cart.total_price).to eq(0)
#   end
#
#   it "updates quantity of items in cart" do
#     cart.add_item(item_1.id)
#     cart.update_quantity({"quantity"=>"3", "item_id"=>item_1.id.to_s})
#
#     expect(cart.contents[item_1.id.to_s]).to eq(3)
#   end
#
#   it "will not update quantity if new quantity less than 0" do
#     cart.add_item(item_1.id)
#     cart.update_quantity({"quantity"=>"-3", "item_id"=>item_1.id.to_s})
#
#     expect(cart.contents[item_1.id.to_s]).to be_nil
#
#     cart.add_item(item_1.id)
#     cart.update_quantity({"quantity"=>"0", "item_id"=>item_1.id.to_s})
#
#     expect(cart.contents[item_1.id.to_s]).to be_nil
#   end
#
#   it "will delete item from cart" do
#     cart.add_item(item_1.id)
#     cart.delete_item(item_1.id.to_s)
#
#     expect(cart.contents[item_1.id.to_s]).to be_nil
#   end
# end
