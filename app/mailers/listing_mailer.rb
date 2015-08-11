class ListingMailer < ApplicationMailer

  def created(listing_id)
    @listing = Listing.find(listing_id)
    @user = @listing.user

    mail to: @user.email, bcc: 'airstreamlist@eruva.com', subject: "[AirstreamList] Your Listing Is Ready!"
  end
end
