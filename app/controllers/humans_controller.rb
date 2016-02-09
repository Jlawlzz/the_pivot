class HumansController < ApplicationController

  def index
    @humans = Human.all
    # @travesties = Travesty.all.distinct
  end

  def show
    @human = Human.find(params[:id])
    # @reviews = @item.reviews
  end

  def decomission_human
    business = Business.find(current_business)
    human = Human.find(params[:format])
    human.auctions.last.update_attribute(:status, 'fired')
    human.auctions << Auction.create

    redirect_to admin_business_path(business.url, business.id)
  end

end
