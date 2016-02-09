class BidsController < ApplicationController

  def create
    @auction = Auction.find(set_auction_id)
    if @auction.highest_bid?(params[:bid][:amount])
      # if_successful

      bid = Bid.create(set_bid_params)
      @auction.set_high_bid(bid.id)
      flash[:notice] = {color: "green", message: "You have succesfully placed a bid of #{bid.amount}!"}
      redirect_to auction_path(set_auction_id)
    else
      # if_unsuccessful
      
      flash[:error] = {color: "red", message: "Must place bid higher than current high bid."}
      redirect_to auction_path(set_auction_id)
    end
  end

  private

  def set_bid_params
    params.require(:bid).permit(:amount,
                                business_id: set_business_id,
                                auction_id: set_auction_id,
                                human_id: current_user)
  end

  def set_business_id
    params[:format].split('/')[1]
  end

  def set_auction_id
    params[:format].split('/')[0]
  end

end
