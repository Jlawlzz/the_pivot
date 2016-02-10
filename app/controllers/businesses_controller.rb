class BusinessesController < ApplicationController
  before_action :business_not_found, only: [:show]

  def index
    @businesses = Business.all
    @humans = nil
  end

  def new
    @business = Business.new
  end

  def create
    @business = Business.create(business_params)
    if @business.save
      role = Role.find_by(name: 'business_admin')
      current_user.user_roles << UserRole.create(business_id: @business.id, role_id: role.id)
      current_user.businesses << @business
      session[:business_id] = @business.id
      redirect_to admin_business_path(@business.url, @business.id)
    else
      flash[:error] = {message: @user.errors.full_messages.join(", "), color: "red"}
      redirect_to new_business_path
    end
  end

  def show
    @business = Business.find(params[:id])
    @auctions = @business.auctions.where.not(status: "fired")
    session[:business_id] = @business.id
  end

  private

    def business_params
      params.require(:business).permit(:name, :description)
    end
end
