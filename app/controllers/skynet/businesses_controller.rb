class Skynet::BusinessesController < ApplicationController
  before_action :set_business

  def activate
    @business.update_attribute(:status, "active")
    redirect_to skynet_dashboard_path
  end

  def deactivate
    @business.update_attribute(:status, "inactive")
    redirect_to skynet_dashboard_path
  end

  def decline
    @business.update_attribute(:status, "declined")
    redirect_to skynet_dashboard_path
  end

  private

    def set_business
      @business = Business.find(params[:id])
    end
end
