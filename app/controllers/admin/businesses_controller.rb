class Admin::BusinessesController < Admin::BaseController
  before_action :current_business, only: [:show]

  def show
    @business = Business.find(params[:id])
    @auctions = @business.auctions.where.not(status: "fired")
    session[:business_id] = @business.id
  end

end
