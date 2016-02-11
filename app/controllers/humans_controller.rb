class HumansController < ApplicationController

  def decomission_human
    business = Business.find(session[:business_id])
    human = Human.find(params[:format])
    human.auctions.last.update_attribute(:status, 'fired')
    human.auctions << Auction.create

    redirect_to admin_business_path(business.url, business.id)
  end

end
