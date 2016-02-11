class AuctionsController < ApplicationController

  before_action :current_business
  before_action :set_business


  def index
    @auctions = Auction.where(status: "live")
  end

  def show
    @auction = Auction.find(params[:id])
  end

  def declare_winner
    @auction = Auction.find(params[:format])
    @business = @auction.business
    @auction.assign_winner
    if @auction.business
      redirect_to business_path(@business.url, @business.id)
    else
      redirect_to dashboard_path
    end
  end

  private

  def set_business
      @name = current_business.name if (current_business != 'personal' && current_business)
      @name = "Yourself" if current_business == 'personal'
  end
end
