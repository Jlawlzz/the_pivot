class Skynet::BusinessesController < ApplicationController

  def update
    @business = Business.find(params[:id])
    @business.update_attribute(:status, "active")
    redirect_to skynet_dashboard_path
  end
end
