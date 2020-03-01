class Admin::UsersController < ApplicationController
  def index
    @title = "Główna (panel administratora) - "
    render status: 423 if current_user.blank? or !current_user.admin?
    @users = User.all
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(params_to_permit)
    if @user.save || !current_user.admin?
      redirect_to admin_users_path
    else
      render :new
    end
  end

  def edit
    @user = User.find_by_id(params[:id])
  end

  def update
    @user = User.find_by_id(params[:id])
    if @user.update_attributes(permitted_params) || !current_user.admin?
      redirect_to admin_users_path
    else
      render :edit
    end
  end

  def destroy
    user = User.find_by_id(params[:id])
    user.destroy
    redirect_to admin_users_path
  end

  def lock_user
    user = User.find_by_id(params[:user_id])
    user.locked_by_admin = true
    user.save
    redirect_to admin_users_path
  end

  private

  def params_to_permit
    params.require(:user).permit(:email, :username, :password, :password_confirmation, :admin)
  end

end