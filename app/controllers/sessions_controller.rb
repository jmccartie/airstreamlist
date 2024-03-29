class SessionsController < ApplicationController

  def new
  end

  def create
    user = login(params[:email].try(:downcase).try(:strip), params[:password], true)
    if user
      redirect_back_or_to root_url, :notice => "Logged in!"
    else
      flash.now.alert = "Email or password was invalid"
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_url
  end

end