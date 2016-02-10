class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.create(set_user)
    if @user.save
      session[:user_id] = @user.id
      redirect_to dashboard_path
    else
      flash[:error] = {message: @user.errors.full_messages.join(", "), color: "red"}
      redirect_to new_user_path
    end
  end

  def show
    if session[:user_id]
      # show
      # UserPresenter(user)
      @user = User.find(session[:user_id])
      @reviews = @user.reviews
      @business = Business.new
      @humans = @user.humans
      @auctions = @user.auctions_won(current_user)
    else
      flash[:error] = {message: "Must be signed in to see dashboard.", color: "red"}
      redirect_to '/'
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user.update(set_user)
    flash[:notice] = "Your detaills have been updated"
    redirect_to dashboard_path
  end

  def assign_business
    @user = current_user
    @business = Business.find(params[:format])
    session[:business_id] = @business.id
    BusinessUser.create(business_id: @business.id, user_id: current_user.id)
    redirect_to admin_business_path(@business.url, @business.id)
  end

  def live_auctions
    live_auctions = current_user.auctions.where(status: 'live')
    @live_auctions = live_auctions.map do |auction|
      {auction: auction, user_bid: auction.bids.where(user_id: @user.id).last.amount}
    end
  end

  private

    def set_user
      params.require(:user).permit(
        :first_name,
        :last_name,
        :username,
        :password,
        :password_confirmation,
      )
    end

end
