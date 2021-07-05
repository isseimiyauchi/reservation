class UsersController < ApplicationController
  def profile
    @user = current_user 
  end

  def acount
    @user = current_user
  end

    
  def update
    if currrent_user.update(user_params)
        redirect_to root_path
    else
       render :acount
      end
  end
  

  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :profile, :avatar)
  end

end