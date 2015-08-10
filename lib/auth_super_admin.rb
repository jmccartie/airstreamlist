class AuthSuperAdmin
  def self.matches?(request)
    if request.session[:user_id]
      user = User.try(:find, request.session[:user_id])
      user.try(:email) == 'jon@mccartie.com'
    end
  end
end