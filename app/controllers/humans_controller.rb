class HumansController < ApplicationController

  def index
    @humans = Human.all
    # @travesties = Travesty.all.distinct
  end

  def show
    @human = Human.find(params[:id])
    # @reviews = @item.reviews
  end

end
