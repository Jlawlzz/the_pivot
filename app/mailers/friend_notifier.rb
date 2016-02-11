

class FriendNotifier < ApplicationMailer
  def inform(user, friend_contact)
    @user = user
    mail(to: friend_contact, subject: "#{@user.first_name} has created an account.")
  end
end
