class Admin::BusinessesController < Admin::BaseController
  before_action :current_business, only: [:show]

  def show
    @business = Business.find(params[:id])
    @humans = nil
  end

end
