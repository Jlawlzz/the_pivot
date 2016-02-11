class HumansController < ApplicationController

  def index
    @humans = Human.all
  end

  def show
    @human = Human.find(params[:id])
  end

  def decomission_human
    business = Business.find(session[:business_id])
    @human = Human.find(params[:format])
    @human.auctions.last.update_attribute(:status, 'fired')
    set_new_auction
    redirect_to admin_business_path(business.url, business.id)
  end

  private

    def set_new_auction
      @human.auctions << Auction.create
    end
end
