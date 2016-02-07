class Admin::BusinessesController < Admin::BaseController

  def show
    binding.pry
    @business = Business.find(params[:id])
    @humans = nil
  end

end
