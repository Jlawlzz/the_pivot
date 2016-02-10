class Skynet::UsersController < ApplicationController

  def show
    @businesses = Business.all
  end

end
