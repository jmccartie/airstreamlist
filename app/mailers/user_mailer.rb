class UserMailer < ApplicationMailer

  def reset_password_email(user)
    @user = user
    @url  = edit_password_reset_url(user.reset_password_token)

    mail(to: @user.email, subject: "[AirstreamList] Reset Your Password")
  end

  def contact(listing_id, from_id, message)
    @listing = Listing.find(listing_id)
    @user = @listing.user
    @from = User.find(from_id)
    @message = message

    mail(to: @user.email, subject: '[AirstreamList] New message about your listing', reply_to: @from.email)
  end

end
