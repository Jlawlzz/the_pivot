class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(username: params[:session][:username])
    @business = Business.find_by(name: params[:session][:name])
    if @user && @user.authenticate(params[:session][:password])
      successful_login_session
    else
      unusuccessful_login_session
    end
  end

  def destroy
    session.clear
    flash[:notice] = {color: "white", message: "Goodbye"}
    redirect_to '/'
  end

  private

    def successful_login_session
      session[:user_id] = @user.id
      flash[:success] = {color: 'green', message: "Logged in as #{@user.first_name}"}
      if !@user.roles.where(name: "skynet").empty?
        redirect_to skynet_dashboard_path
      else
        redirect_to dashboard_path
      end
    end

    def unusuccessful_login_session
      flash[:error] = {color: 'orange', message: "Username or password incorrect."}
      redirect_to login_path
    end
end
