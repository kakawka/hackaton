class RegistrationsController < Devise::RegistrationsController
  def update
    @user = User.find(current_user.id)

    if @user.update(user_params)
      set_flash_message :notice, :updated

      sign_in @user, :bypass => true
      redirect_to after_update_path_for(@user)
    else
      render "edit"
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, :password,
    :password_confirmation)
  end

end
