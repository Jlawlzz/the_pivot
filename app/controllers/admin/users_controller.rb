class Admin::UsersController < Admin::BaseController
  before_action :set_user_and_business, only: [:update]

  def update
    terminate?
    redirect_to admin_business_path(@business.url, @business.id)
  end

  private

    def terminate_user
      @user.user_roles.where(business_id: @business.id)[0].destroy
      @business.business_users.where(user_id: @user.id)[0].destroy
      flash[:notice] = {color: 'green', message: "#{@user.username} has been voted off the island."}
    end

    def terminate?
      terminate_user if @user.terminate?(@business)
    end

    def set_user_and_business
      @user = User.find(params[:id])
      @business = Business.find(params[:format])
      vote = Vote.create(
                        business_id: @business.id,
                        user_id: @user.id,
                        voter: current_user.id
                        )
    end
end
