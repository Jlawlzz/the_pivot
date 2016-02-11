class Skynet::UsersController < ApplicationController

  def show
    @businesses = Business.all
    @pending = @businesses.where(status: "pending")
    @active = @businesses.where(status: "active")
    @inactive = @businesses.where(status: "inactive")
  end

end
