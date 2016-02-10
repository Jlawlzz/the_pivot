class AuctionsController < ApplicationController

  before_action :set_business

  def index
    @auctions = Auction.where(status: "live")
  end

  def show
    @auction = Auction.find(params[:id])
  end

  def declare_winner
    # WinnerPresenter(args) -> ____.winning_bid
    @auction = Auction.find(params[:format])
    @business = Business.find(current_business)
    @auction.assign_winner_of(@auction)
    redirect_to business_path(@business.url, @business.id)
  end

  private

  def set_business
    if params[:business_id]
      @business = Business.find(params[:business_id])
      session[:business_id] = @business.id
      @name = @business.name
    else
      @name = "Yourself"
    end
  end
end
