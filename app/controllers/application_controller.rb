class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :locked_account_verification
  before_action :authenticate_user!
  before_action :registrations_redirect

  def registrations_redirect
    if params[:controller] == 'users/registrations' and params[:action] == 'new'
      redirect_to zaloguj_path
    end
  end

  def locked_account_verification
    if user_signed_in?
      if current_user.locked_by_admin? && params[:controller] != "users/sessions"
        flash[:alert] = "Przepraszamy, ale twoje konto zostało zablokowane..."
        redirect_to destroy_user_session_path
      end
    end
  end
end
