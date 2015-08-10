# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/reset_password
  def reset_password
    UserMailer.reset_password
  end

  def contact
    UserMailer.contact(Posting.last.id, User.first.id, FFaker::Lorem.paragraphs.first)
  end

end
