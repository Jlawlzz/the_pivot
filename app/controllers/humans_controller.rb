class HumansController < ApplicationController

  def decomission_human
    @business = Business.find(session[:business_id])
    @human = Human.find(params[:format])
    fired_human
    set_new_auction
    route_after_fire
  end

  private

    def route_after_fire
      redirect_to admin_business_path(@business.url, @business.id) if @business
      redirect_to dashboard_path if @business == nil
    end

    def set_new_auction
      @human.auctions << Auction.create
    end

    def fired_human
      @human.auctions.last.update_attribute(:status, 'fired')
    end
end
