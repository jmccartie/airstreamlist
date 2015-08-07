class SignupController < ApplicationController
  skip_before_filter :require_login
  skip_before_filter :redirect_inactive_org!
  # layout 'marketing'

  def new
    @signup = Signup.new
  end

  def create
    @signup = Signup.new(params[:signup])

    if @signup.save
      session[:organization_id] = @signup.organization.id
      auto_login(@signup.user)
      redirect_to after_signup_path(:welcome)
    else
      render :new
    end
  end

end