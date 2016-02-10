class CartItemsController < ApplicationController
	include ActionView::Helpers::TextHelper
	include ActionView::Helpers::UrlHelper

	def create
		item = Item.find(params[:item_id])
		@cart.add_item(item.id)

		session[:cart] = @cart.contents
		flash[:notice] = {color: "white", message: "You have #{pluralize(@cart.count_of, "item")} in your cart."}

		redirect_to '/items'
	end

	def destroy
		@item = Item.find(params[:id])
		flash_link = "#{view_context.link_to @item.title, item_path(@item)}"
		flash[:success] = {color: "green", message: "Successfully removed #{flash_link} from your cart."}
		@cart.delete_item(params[:id])
		redirect_to cart_path
	end

	def update
		@cart.update_quantity(params[:qty_update_data])
		redirect_to cart_path
	end
end
