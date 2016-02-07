class SessionsController < ApplicationController

  def new

  end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:success] = {color: 'green', message: "Logged in as #{@user.first_name}"}
      redirect_to dashboard_path
    else
      flash[:error] = {color: 'orange', message: "Username or password incorrect."}
      redirect_to login_path
    end
  end

  def destroy
    session.clear
    flash[:notice] = {color: "white", message: "Goodbye"}
    redirect_to '/'
  end

  def doomsday
    render :doomsday
  end

end
