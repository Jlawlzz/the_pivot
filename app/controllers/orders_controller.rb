class OrdersController < ApplicationController
  include ActionView::Helpers::TextHelper
  before_action :validate_user

  def validate_user
    if current_user.nil?
      flash[:login] = {color: 'red', message: "Please log in to check out"}
      redirect_to '/login'
    end
  end

  def index
    @orders = current_user.orders
  end

  def create
    @order = current_user.orders.create(status: "ordered",
                                        total_price: @cart.total_price)
    add_items_to_order
    flash[:order_success] = {color: 'green', message: "Order was successfully placed"}
    set_doomsday_flash_message
    redirect_to orders_path
    session[:cart] = {}
  end

  def show
    # presenter 
    @order = Order.find(params[:id]) if current_user.admin?
    @order = current_user.orders.find(params[:id]) if !current_user.admin?
    @items = @order.order_items
  end

  def update
    @order = Order.find(params[:id])
    @order.update(status: params[:status])
    redirect_to admin_orders_path
  end

  private

  def set_doomsday_flash_message
    if current_user && current_user.total_purchased >= 50000
      flash_link = "#{view_context.link_to 'Doomsday', doomsday_path}"
      flash[:alert] = {color: 'red', message: "Doomsday Hath Commeth: #{flash_link} "}
    end
  end

  def total_price
    @cart.total_price
  end

  def add_items_to_order
    @cart.contents.each do |item_id, qty|
      item = Item.find(item_id)
      @order.order_items.create(
        item_id: item_id,
        item_quantity: qty,
        item_price: item.price
      )
    end
  end
end
