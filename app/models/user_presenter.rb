class UserPresenter
  attr_reader :user, :businesses, :humans, :auctions

  def initialize(user)
    @user = user
    @businesses = @user.businesses
    @humans = @user.humans
    @auctions = @user.auctions_won(@user)
  end
end
