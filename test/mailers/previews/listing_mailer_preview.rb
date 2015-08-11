# Preview all emails at http://localhost:3000/rails/mailers/listing
class ListingMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/listing/created
  def created
    ListingMailer.created(Listing.last.id)
  end

end
