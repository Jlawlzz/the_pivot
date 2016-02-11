class PermissionService
  extend Forwardable
  attr_reader :user, :controller, :action

  def_delegators :user, :skynet?,
                        :business_admin?,
                        :registered_user?

  def initialize(user)
    @user = user || User.new
  end

  def allow?(controller, action)
    @controller = controller
    @action = action
    case
    when skynet?
      skynet_permissions
    when business_admin?
      business_admin_permissions
    when registered_user?
      registered_user_permissions
    else
      guest_user_permissions
    end
  end

  private

    def skynet_permissions
      return true
    end

    def guest_user_permissions
      return true if controller == "home" && action.in?(%w(index))
      return true if controller == "sessions" && action.in?(%w(new create))
      return true if controller == "auctions" && action.in?(%w(index))
      return true if controller == "users" && action.in?(%w(new create))
      return true if controller == "businesses" && action.in?(%w(index))
    end

    def business_admin_permissions
      return true if controller == "home" && action.in?(%w(index))
      return true if controller == "sessions" && action.in?(%w(new create destroy))
      return true if controller == "users" && action.in?(%w(show new edit live_auctions assign_business))
      return true if controller == "admin/users" && action.in?(%w(update))
      return true if controller == "auctions" && action.in?(%w(index show declare_winner))
      return true if controller == "bids" && action.in?(%w(create))
      return true if controller == "admin/businesses" && action.in?(%w(show new create))
      return true if controller == "businesses" && action.in?(%w(new create index show))
      return true if controller == "humans" && action.in?(%w(decomission_human))
    end

    def registered_user_permissions
      return true if controller == "home" && action.in?(%w(index))
      return true if controller == "sessions" && action.in?(%w(new create destroy))
      return true if controller == "users" && action.in?(%w(show update live_auctions assign_business new edit))
      return true if controller == "auctions" && action.in?(%w(index show))
      return true if controller == "businesses" && action.in?(%w(new index create))
      return true if controller == "admin/businesses" && action.in?(%w(show))
      return true if controller == "businesses" && action.in?(%w(new create index))
      return true if controller == "bids" && action.in?(%w(new create index))
    end
end
