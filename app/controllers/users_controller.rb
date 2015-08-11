class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = current_user
  end

  def create
    @user = User.new(user_params)

    if @user.save
      auto_login(@user)
      redirect_to root_url, notice: "Welcome!"
    else
      render :new
    end
  end

  def update
    if current_user.update(user_params)
      redirect_to root_url, notice: 'Your profile was successfully updated.'
    else
      @user = current_user
      render :edit
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :phone, :password_confirmation)
    end

end