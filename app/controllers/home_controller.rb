class HomeController < ApplicationController

  def index
    # niezalogowany
    unless user_signed_in?
      @title = "Główna (niezalogowany) - "
      render :unlogged
      return
    end
    @title = "Główna (#{current_user.username})"
  end

end