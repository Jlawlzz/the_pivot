class Admin::BusinessesController < Admin::BaseController

  def show
    @business = Business.find(params[:id])
    @humans = nil
  end

end
