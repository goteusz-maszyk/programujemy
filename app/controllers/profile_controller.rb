class ProfileController < ApplicationController
  def edit
    @user = User.find_by_id(current_user.id)
  end
  def update
    @user = User.find_by_id(current_user.id)
    if @user.update_attributes(params_to_permit)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def params_to_permit
    params.require(:user).permit(:email, :username, :password, :password_confirmation, :description)
  end
end