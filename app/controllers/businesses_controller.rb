class BusinessesController < ApplicationController
  # before_action :business_not_found

  def index
    @businesses = Business.all
    @humans = nil
  end

  def new
    @business = Business.new
  end

  def create
    @business = Business.create(business_params)
    redirect_to admin_business_path(@business.url, @business.id)
  end

  def show
    business_not_found
    # binding.pry
    @business = Business.find(params[:id])
  end

  private

    def business_params
      params.require(:business).permit(:name, :description)
    end
end
