class Skynet::BusinessesController < ApplicationController

  def activate
    @business = Business.find(params[:id])
    @business.update_attribute(:status, "active")
    redirect_to skynet_dashboard_path
  end

  def deactivate
    @business = Business.find(params[:id])
    @business.update_attribute(:status, "inactive")
    redirect_to skynet_dashboard_path
  end

  def decline
    @business = Business.find(params[:id])
    @business.update_attribute(:status, "declined")
    redirect_to skynet_dashboard_path
  end
end
