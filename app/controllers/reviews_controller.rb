# class ReviewsController < ApplicationController
#
#   def new
#     @review = Review.new
#     @item = Item.find(params[:item_id])
#   end
#
#   def create
#     @item = Item.find(params[:item_id])
#     @review = Review.create(review_params)
#     current_user.reviews << @review
#     @item.reviews << @review
#     redirect_to item_path(@item)
#   end
#
#   def destroy
#     @review = Review.find(params[:id])
#     @review.destroy
#     redirect_to dashboard_path
#   end
#
#   def index
#     @items = Item.all
#   end
#
#   private
#
#   def review_params
#     params.require(:review).permit(:text, :stars)
#   end
#
# end
