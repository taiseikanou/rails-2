class UsersController < ApplicationController
  def edit
  end
  def show
  end
  def update
  end



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
      redirect_to root_path
    else
      render "edit"
    end
  end


  def user_params
    params.require(:user).permit(:name,:introduction,:email)
  end
  
end

