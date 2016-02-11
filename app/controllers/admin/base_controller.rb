class Admin::BaseController < ApplicationController

  helper_method :current_business

  def current_business
    @current_business ||= Business.find_by(url: params[:business])
  end

  def business_not_found
    redirect_to businesses_path if current_business.nil?
  end

  def show

  end

end
