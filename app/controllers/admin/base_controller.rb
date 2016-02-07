class Admin::BaseController < ApplicationController
  before_action :business_not_found

  helper_method :current_business

  def current_business
    @current_business ||= Business.find_by(url: params[:business])
  end

  def business_not_found
    redirect_to businesses_path if current_business.nil?
  end

  # before_action :require_admin

  # def require_admin
  #   render file: "/public/404" unless current_admin?
  # end

  def show

  end

end
