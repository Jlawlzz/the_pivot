class BusinessesController < ApplicationController

  def index
    @businesses = Business.all
  end

  def new
    @business = Business.new
  end

  def create
    @business = Business.create(business_params)
    redirect_to admin_business_path(@business)
  end

  def show
    @business = Business.find(params[:id])
  end

  private

    def business_params
      params.require(:business).permit(:name, :description)
    end
end
