class Account::PasswordsController < ApplicationController
  before_action :authenticate_user!

  def edit
    @user = current_user
  end

  def update
    @user = User.find(current_user.id)

    if @user.update(password_params)
      flash[:notice] = "密码修改成功"
      # Sign in the user by passing validation in case their password changed
      bypass_sign_in(@user)
      redirect_to edit_account_user_path(current_user)
    else
      render :edit
    end
  end


  private

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end



end
