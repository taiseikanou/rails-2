class UsersController < ApplicationController
  def profile
    @user = current_user
  end

  def destroy
  end

  def profile_edit
    @user = current_user
  end

  def profile_update
    @user = current_user
    if @user.update(user_params)
      redirect_to users_account_path
    else
      render "profile_edit"
    end
  end

  def user_params
    params.require(:user).permit(:name,:introduction,:email,:profile_image)
  end
  
end

