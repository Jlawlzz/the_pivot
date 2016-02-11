class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :current_business
  before_action :current_user, :authorize!
  helper_method :business_not_found

  def business_not_found
    redirect_to businesses_path if Business.find_by(url: params[:business]).nil?
  end

  def current_user
    @user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_admin?
    current_user && current_user.admin?
  end

  def current_business
    if (params[:business_id] != 'personal') && params[:business_id]
      session[:business_id] = params[:business_id]
      @business = Business.find(session[:business_id])
    elsif params[:business_id] == 'personal'
      session[:business_id] = 'personal'
    end
  end

  def current_permission
    @current_permission ||= PermissionService.new(current_user)
  end

  def authorized?
    current_permission.allow?(params[:controller], params[:action])
  end

  def authorize!
    unless authorized?
      redirect_to root_path, flash[:notice] = {color: "red", message: "You do not have that level of access"}
    end
  end
end
