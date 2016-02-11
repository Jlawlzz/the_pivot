class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.create(set_user)
    if @user.save
      create_successfull
    else
      create_unsuccessfull
    end
  end

  def show
    if session[:user_id]
      @user_object = UserPresenter.new(current_user)
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
    flash[:notice] = "Your details have been updated"
    redirect_to dashboard_path
  end

  def assign_business
    @user = current_user
    @business = Business.find(params[:format])
    setup_business_relationships
    redirect_to admin_business_path(@business.url, @business.id)
  end

  def live_auctions
    bids = current_user.bids
    @live_auctions = bids.map do |bid|
      if bid.auction.status == 'live'
        {auction: bid.auction, user_bid: bid}
      end
    end
    @live_auctions.compact!
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

    def create_successfull
      session[:user_id] = @user.id
      role = Role.find_by(name: "registered_user")
      UserRole.create(user_id: @user.id, role_id: role.id)
      redirect_to dashboard_path
      #send email upon account creation
      FriendNotifier.inform(current_user, 'charissalaw@gmail.com').deliver_later
      flash[:notice] = {color: "green", message: "Email verification has been sent to the administrator."}
    end

    def create_unsuccessfull
      flash[:error] = {message: @user.errors.full_messages.join(", "), color: "red"}
      redirect_to new_user_path
    end

    def setup_business_relationships
      session[:business_id] = @business.id
      BusinessUser.create(business_id: @business.id, user_id: current_user.id)
      role = Role.find_by(name: "business_admin")
      current_user.user_roles << UserRole.create(business_id: @business.id, role_id: role.id)
    end
end
